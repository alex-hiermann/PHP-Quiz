<!DOCTYPE html>

<head>
	<title>Quiz</title>
	<meta charset="utf-8" />
	<link rel="shortcut icon" href="quizIcon.ico" />
	<link rel="stylesheet" href="../styles.css">
</head>

<body>
	<header>
		<h1>Quiz!</h1>
	</header>
	<h2>Category selection</h2>
	<form action='<?php echo $_SERVER['PHP_SELF']; ?>' method='POST'>
		<?php
		//open the select
		echo "<select name='categories' id='categories'>";

		//ensure database acccess for the categories
		try {
			$pdo = new PDO('mysql:host=localhost;dbname=quiz', 'root', '');
			$statement = $pdo->prepare("SELECT * FROM Kategorien");
			$statement->execute(array());
		} catch (PDOException $pdoException) {
			die("</select>$pdoException</form></body></html>");
		}
		echo "<option value='0' disabled selected>Choose categorie</option>";
		//while-loop for each options
		while ($row = $statement->fetch()) {
			$category = $row['name'];
			$id = $row['pk_kategorie_id'];
			if ($id == $_POST['categories']) {
				$selectedValue = "selected";
			} else $selectedValue = "";
			echo "<option value='$id' $selectedValue>$category</option>";
		}

		//close the select
		echo "</select><br><br><button type='submit' name='submit' value='quiz started'>Start the quiz!</button>";
		echo "<button type='submit' name='info' value='information acquired'>Category info</button>";
		echo "<button type='submit' name='check' value='result acquired'>Check your answers</button><br><br><hr>";

		if (isset($_POST['info'])) {
			if (!empty($_POST['categories'])) {
				try {
					$statement = $pdo->prepare("SELECT * FROM Kategorien");
					$statement->execute(array());
				} catch (PDOException $pdoException) {
					die("$pdoException</form></body></html>");
				}
				//while-loop for each options
				while ($row = $statement->fetch()) {
					if ($_POST['categories'] == $row['pk_kategorie_id']) {
						$category = $row['beschreibung'];
						echo $category . '<br>';
					}
				}
			}
		}
		//get the id from the selected category
		if (isset($_POST['submit'])) {
			if (!empty($_POST['categories'])) {
				$outValue = $_POST['categories'];
				//ensure database access for the questions
				try {
					$statement = $pdo->prepare("SELECT  * FROM Fragen WHERE $outValue = fk_kategorie_id");
					$statement->execute(array());
				} catch (PDOException $pdoException) {
					die("$pdoException</form></body></html>");
				}
				//while-loop for each question for the category
				while ($row = $statement->fetch()) {
					$buttonStyle = $row['type'];
					$inValue = $row['pk_fragen_id'];
					echo $row['text'] . "<br>";
					//ensure database access for the answers
					try {
						$statement2 = $pdo->prepare("SELECT * FROM Antworten WHERE $inValue = fk_fragen_id");
						$statement2->execute(array());
					} catch (PDOException $pdoException) {
						die("$pdoException</form></body></html>");
					}
					//while-loop for each answer for the question
					while ($row2 = $statement2->fetch()) {
						//get all required information about the answer
						$radioID = $row2['fk_fragen_id'];
						$radioValue = $row2['pk_antwort_id'];
						$radioLabel = $row2['text'];
						//create a radio button for each answer for each question with logical names, ids and labels
						switch ($buttonStyle) {
							case 2:
								echo "<label><input type='checkbox' name=$radioValue value=$radioID> $radioLabel</label><br>";
								break;

							case 3:
								echo "<input type='search' name=$radioID><br>";
								break;

							default:
								echo "<label><input type='radio' name=$radioID value=$radioValue> $radioLabel</label><br>";
						}
					}
					echo "<hr>";
				}
			}
		}
		if (isset($_POST['check'])) {
			$answerCount = 0;
			$result = 0;
			$lastKey = 0;
			foreach ($_POST as $key => $value) {
				if (!is_numeric($key)) continue;
				try {
					$statement = $pdo->prepare("SELECT * FROM Fragen WHERE $key = pk_fragen_id");
					$statement->execute(array());
					$statement4 = $pdo->prepare("SELECT * FROM Fragen WHERE $value = pk_fragen_id");
					$statement4->execute(array());
				} catch (PDOException $pdoException) {
					die("$pdoException</form></body></html>");
				}
				while ($row = $statement->fetch()) {
					if ($key == $row['pk_fragen_id']) {
						echo "<p>Question: ";
						$buttonID = $row['type'];
						echo $row['text'] .  "<br> Your choice: ";
						try {
							$statement2 = $pdo->prepare("SELECT * FROM Antworten");
							$statement2->execute(array());
						} catch (PDOException $pdoException) {
							die("$pdoException</form></body></html>");
						}
						while ($row2 = $statement2->fetch()) {
							if ($buttonID == 1) {
								if (is_numeric($key)) {
									if ($value == $row2['pk_antwort_id']) {
										echo $row2['text'];
										if ($row2['gueltigkeit'] == TRUE) {
											echo " 🡆 this was the correct answer!</p>";
											$result++;
										} else {
											echo " 🡆 this was the incorrect answer!</p>";
										}
										$answerCount++;
										echo "<hr>";
									}
								}
							} elseif ($buttonID == 3) {
								if ($row['pk_fragen_id'] == $row2['fk_fragen_id'] && $key != "categories" && $key != "check") {
									echo $value;
									if ($value == $row2['text']) {
										echo " 🡆 this was the correct answer!</p>";
										$result++;
									} else {
										echo " 🡆 this was the incorrect answer!</p>";
									}
									$answerCount++;
									echo "<hr>";
								}
							}
						}
					}
				}
				while ($row4 = $statement4->fetch()) {
					if ($value == $lastKey) break;
					try {
						$statement3 = $pdo->prepare("SELECT * FROM Antworten INNER JOIN Fragen F on Antworten.fk_fragen_id = F.pk_fragen_id WHERE type = 2 AND $value = fk_fragen_id");
						$statement3->execute(array());
					} catch (PDOException $pdoException) {
						die("$pdoException</form></body></html>");
					}
					if ($row4[3] == 2) {
						echo "<p>Question: " . $row4['text'] . "<br> You choices(s) were: ";
					}
					$correctAnswer = false;
					$loop = false;
					while ($row3 = $statement3->fetch()) {
						$loop = true;
						foreach ($_POST as $key2 => $value) {
							if (is_numeric($key)) {
								if ($row3['gueltigkeit'] == false && $row3['pk_antwort_id'] == $key2) {
									$correctAnswer = false;
									break 2;
								} else if ($row3['gueltigkeit'] == true && $row3['pk_antwort_id'] == $key2) {
									$correctAnswer = true;
									break;
								}
							}
						}
					}
					if ($loop && $correctAnswer) {
						echo "correct!</p>";
						$result++;
						$answerCount++;
					} else if ($loop && !$correctAnswer) {
						echo "incorrect!</p><hr>";
						$answerCount++;
					}
				}
				$lastKey = $value;
			}
			echo "<p style='color:goldenrod'>Your result: you picked " . $result . " out of " . $answerCount . " correct answers which is a hit rate of " . $result / $answerCount * 100 . "%!</p>";
		}

		//close the form
		echo "</form>";
		?>
		<footer>
			<nav>
				<ul>
					<li>
						<span></span><span></span><span></span><span></span>
						<a href="../index.php" style="font-weight:bolder">home</a>
					</li>
					<li>
						<span></span><span></span><span></span><span></span>
						<a href="../admin/admin.php" style="font-weight:bolder">admin panel</a>
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