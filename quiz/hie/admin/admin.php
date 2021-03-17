<!DOCTYPE html>

<head>
	<title>Admin Panel</title>
	<meta charset="utf-8" />
	<link rel="shortcut icon" href="icon.ico">
	<link rel="stylesheet" href="../styles.css">
	<script src="script.js" defer></script>
</head>

<body>
	<header>
		<h1>Admin Panel</h1>
	</header>
	<section>
		<div class="list">
			<?php $pdo = new PDO('mysql:host=localhost;dbname=quiz', 'root', ''); ?>
			<form action='<?php echo $_SERVER['PHP_SELF']; ?>' method='GET'>
				<p>Type a category into the category list!</p>
				<input type="text" name="newCategory" class="addCategoryInput">
				<button class="addCategoryButton" name="addCategory" value="addedCategory">Add Category</button>
				<button class="removeCategoryButton" name="removeCategory" value="removedCategory">Remove last category</button>
				<p>Is your new category a subcategory of another category?</p>
				<?php
				//open the select
				echo "<select name='subcategories' id='subcategories'>";

				//ensure database acccess for the categories
				try {
					$statement = $pdo->prepare("SELECT * FROM Kategorien");
					$statement->execute(array());
				} catch (PDOException $pdoException) {
					die("</select>$pdoException</form></body></html>");
				}
				echo "<option value='0' selected>Not a subcategory</option>";
				//while-loop for each options
				while ($row = $statement->fetch()) {
					$category = $row['name'];
					$id = $row['pk_kategorie_id'];
					echo "<option value='$id'>$category</option>";
				}
				echo "</select>";
				?>
			</form>

			<?php if (isset($_GET['addCategory']) && isset($_GET['newCategory'])) {
				try {
					if (isset($_GET['subcategories']) && $_GET['subcategories'] != 0) {
						$sql = "INSERT INTO Kategorien (fk_unterkategorie_id, name, beschreibung) VALUES ('" . $_GET['subcategories'] . "', '" . $_GET['newCategory'] . "', 'User-created category.')";
						echo $_GET['subcategories'];
					} else {
						$sql = "INSERT INTO Kategorien (name, beschreibung) VALUES ('" . $_GET['newCategory'] . "', 'Usercreated category.')";
					}
					$pdo->exec($sql);
					header("Refresh:0 url=admin.php");
					echo "Added successfully!";
				} catch (PDOException $pdoException) {
					die("$pdoException</div></body></html>");
				}
			}

			if (isset($_GET['removeCategory'])) {
				try {
					$sql = "DELETE FROM Kategorien ORDER BY pk_kategorie_id DESC LIMIT 1";
					$pdo->exec($sql);
					header("Refresh:0 url=admin.php");
					echo "Deleted successfully!";
				} catch (PDOException $pdoException) {
					die("$pdoException</div></body></html>");
				}
			}
			?>

			<ul id="categoryList">
				<?php
				try {
					$statement = $pdo->prepare("SELECT * FROM Kategorien WHERE fk_unterkategorie_id IS NULL");
					$statement->execute(array());
				} catch (PDOException $pdoException) {
					die("$pdoException</body></html>");
				}
				while ($row = $statement->fetch()) {
					$category = $row['name'];
					echo "<li class='listItem'>- $category";
					recursiveFunction($row, $pdo);
					echo "</li>";
				}

				function recursiveFunction($row, $pdo)
				{
					echo "<ul>";
					try {
						$statement2 = $pdo->prepare("SELECT * FROM Kategorien WHERE fk_unterkategorie_id IS NOT NULL");
						$statement2->execute(array());
					} catch (PDOException $pdoException) {
						die("$pdoException</body></html>");
					}
					while ($row2 = $statement2->fetch()) {
						$subcategory = $row2['name'];
						if ($row['pk_kategorie_id'] == $row2['fk_unterkategorie_id']) {
							echo "<li class='listItem'>↳ $subcategory</li>";
							recursiveFunction($row2, $pdo);
						}
					}
					echo "</ul>";
				}
				?>
			</ul>
		</div>


		<div class="list">
			<p>Type a question to advance the category!</p>
			<form action='<?php echo $_SERVER['PHP_SELF']; ?>' method='GET'>
				<input type="search" name="newQuestion" class="addQuestionInput">

				<?php
				//open the select
				echo "<select name='questions' id='questions'>";

				//ensure database acccess for the categories
				try {
					$statement = $pdo->prepare("SELECT * FROM Kategorien");
					$statement->execute(array());
				} catch (PDOException $pdoException) {
					die("</select>$pdoException</form></body></html>");
				}
				echo "<option value='0' disabled selected>Choose category</option>";
				//while-loop for each options
				while ($row = $statement->fetch()) {
					$category = $row['name'];
					$id = $row['pk_kategorie_id'];
					if ($id == $_GET['questions']) {
						$selectedValue = "selected";
					} else $selectedValue = "";
					echo "<option value='$id' $selectedValue>$category</option>";
				}
				echo "</select>";
				?>
				<button class="addQuestionButton" name="addQuestion" value="addedQuestion">Add question</button>
				<button class="removeQuestionButton" name="removeQuestion" value="removedQuestion">Remove last question</button>
				<button class="reloadCategoriesButton" name="reloadCategories" value="reloadedCategories">Reload questions</button>
				<select name='buttonTypes' id='buttonTypes'>
				<option id="radio">Radiobuttons</option>
				<option id="checkbox">Checkboxes</option>
				<option id="search">Search-Fields</option>
				</select>
			</form>
			<?php
			if (isset($_GET['addQuestion']) && isset($_GET['newQuestion'])) {
				switch($_GET['buttonTypes']) {
					case "Checkboxes":
						$buttonType = 2;
						break;

					case "Search-Fields":
						$buttonType = 3;
						break;

					default:
						$buttonType = 1;
				}
				try {
					$sql = "INSERT INTO Fragen (fk_kategorie_id, text, type) VALUES ('" . $_GET['questions'] . "', '" . $_GET['newQuestion'] . "', '$buttonType')";
					$pdo->exec($sql);
				} catch (PDOException $pdoException) {
					die("$pdoException</div></body></html>");
				}
			}

			if (isset($_GET['removeQuestion'])) {
				try {
					$sql = "DELETE FROM Fragen ORDER BY pk_fragen_id DESC LIMIT 1";
					$pdo->exec($sql);
				} catch (PDOException $pdoException) {
					die("$pdoException</div></body></html>");
				}
			}

			echo "<ul id='questionList'>";
			loadQuestions($pdo);
			
			function loadQuestions($pdo)
			{
				if (!empty($_GET['questions'])) {
					$outValue = $_GET['questions'];
					//ensure database access for the questions
					try {
						$statement = $pdo->prepare("SELECT * FROM Fragen");
						$statement->execute(array());
					} catch (PDOException $pdoException) {
						die("$pdoException</form></body></html>");
					}
					//while-loop for each question for the category
					while ($row = $statement->fetch()) {
						if ($outValue == $row['fk_kategorie_id']) {
							echo "<li>- " . $row['text'] . "</li>";
						}
					}
				}
			}
			?>
		</div>


		<div class="list">
			<p>Type a answer to advance the question!</p>
			<form action='<?php echo $_SERVER['PHP_SELF']; ?>' method='GET'>
				<input type="search" name="newAnswer" class="addAnswerInput">

				<?php
				//open the select
				echo "<select name='answers' id='answers'>";

				//ensure database acccess for the categories
				try {
					$statement = $pdo->prepare("SELECT * FROM Fragen");
					$statement->execute(array());
				} catch (PDOException $pdoException) {
					die("</select>$pdoException</form></body></html>");
				}
				echo "<option value='0' disabled selected>Choose question</option>";
				//while-loop for each options
				while ($row = $statement->fetch()) {
					$category = $row['text'];
					$id = $row['pk_fragen_id'];
					if ($id == $_GET['answers']) {
						$selectedValue = "selected";
					} else $selectedValue = "";
					echo "<option value='$id' $selectedValue>$category</option>";
				}
				echo "</select>";
				?>
				<button class="addAnswerButton" name="addAnswer" value="addedAnswer">Add answer</button>
				<button class="removeAnswerButton" name="removeAnswer" value="removedAnswer">Remove last answer</button>
				<button class="reloadCategoriesButton" name="reloadCategories" value="reloadedCategories">Reload answers</button>
				<br><label><input type='checkbox' name='validation1' value='1'> Correct answer</label>
			</form>
			<?php
			if (isset($_GET['addAnswer']) && isset($_GET['newAnswer'])) {
				try {
					if (isset($_GET['validation1'])) {
						$sql = "INSERT INTO Antworten (fk_fragen_id, text, gueltigkeit) VALUES ('" . $_GET['answers'] . "', '" . $_GET['newAnswer'] . "', ' " . $_GET['validation1'] . "')";
					}
						else $sql = "INSERT INTO Antworten (fk_fragen_id, text, gueltigkeit) VALUES ('" . $_GET['answers'] . "', '" . $_GET['newAnswer'] . "', '0')";
					$pdo->exec($sql);
				} catch (PDOException $pdoException) {
					die("$pdoException</div></body></html>");
				}
			}

			if (isset($_GET['removeAnswer'])) {
				try {
					$sql = "DELETE FROM Antworten ORDER BY pk_antwort_id DESC LIMIT 1";
					$pdo->exec($sql);
				} catch (PDOException $pdoException) {
					die("$pdoException</div></body></html>");
				}
			}
			
			echo "<ul id='answerList'>";
			loadAnswers($pdo);
			
			function loadAnswers($pdo)
			{
				if (!empty($_GET['answers'])) {
					$outValue = $_GET['answers'];
					//ensure database access for the questions
					try {
						$statement = $pdo->prepare("SELECT * FROM Antworten");
						$statement->execute(array());
					} catch (PDOException $pdoException) {
						die("$pdoException</form></body></html>");
					}
					//while-loop for each question for the category
					while ($row = $statement->fetch()) {
						if ($outValue == $row['fk_fragen_id']) {
							echo "<li>- " . $row['text'] . "</li>";
						}
					}
				}
			}
			?>
		</div>
	</section>
	<footer>
		<nav>
			<ul>
				<li>
					<span></span><span></span><span></span><span></span>
					<a href="../index.php" style="font-weight:bolder">home</a>
				</li>
				<li>
					<span></span><span></span><span></span><span></span>
					<a href="../quiz/quiz.php" style="font-weight:bolder">quiz</a>
				</li>
				<li>
					<span></span><span></span><span></span><span></span>
					<a href=".." style="font-weight:bolder">services</a>
				</li>
				<li>
					<span></span><span></span><span></span><span></span>
					<a href=".." style="font-weight:bolder">contact</a>
				</li>
			</ul>
		</nav>
	</footer>
</body>

</html>