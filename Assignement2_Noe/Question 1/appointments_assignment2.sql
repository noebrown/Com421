SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointments_assignment2`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AppointmentId` int(11) NOT NULL,
  `AppointmentTime` datetime DEFAULT NULL,
  `ServiceProviderId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `ServiceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppointmentId`, `AppointmentTime`, `ServiceProviderId`, `CustomerId`, `ServiceId`) VALUES
(1, '2022-01-18 10:30:00', 1, 1, 1),
(2, '2022-01-20 09:00:00', 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CompanyId` int(11) NOT NULL,
  `CompanyName` varchar(150) DEFAULT NULL,
  `CompanyAddress` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyId`, `CompanyName`, `CompanyAddress`) VALUES
(1, 'Happy Spa', '123 Sesame Street, New York, NY 24744'),
(2, 'Your Spa', '890 The Street Raleigh, NC 48844');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) NOT NULL,
  `CustomerPhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerId`, `FirstName`, `LastName`, `CustomerPhoneNumber`) VALUES
(1, 'Mary', 'Smith', '555 555 5555'),
(2, 'John', 'Hunt', '555 555 5556'),
(3, 'Jimmy', 'Jones', '555 555 5558'),
(4, 'Mary', 'Smith', '777 777 8888'),
(5, 'Mikaela', 'Swigg', '4155746848'),
(6, 'Dalston', 'Schenfisch', '2666731572'),
(7, 'Donalt', 'Crown', '5109404208'),
(8, 'Tabatha', 'Plaid', '2062381450'),
(9, 'Albertine', 'Broxup', '4641119563'),
(10, 'Shannen', 'Gaskin', '4313702355'),
(11, 'Weber', 'Allebone', '6462572363'),
(12, 'Lanie', 'Arnould', '8215894787'),
(13, 'Dari', 'Witcherley', '3375485325');

-- --------------------------------------------------------

--
-- Table structure for table `customerorderdetails`
--

CREATE TABLE `customerorderdetails` (
  `CustomerOrderDetailsId` int(11) NOT NULL,
  `CustomerOrderId` int(11) NOT NULL,
  `ServiceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customerorders`
--

CREATE TABLE `customerorders` (
  `CustomerOrderId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `CompanyId` int(11) NOT NULL,
  `AppointmentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `serviceprovider`
--

CREATE TABLE `serviceprovider` (
  `ServiceProviderId` int(11) NOT NULL,
  `ProviderName` varchar(150) DEFAULT NULL,
  `CompanyId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `serviceprovider`
--

INSERT INTO `serviceprovider` (`ServiceProviderId`, `ProviderName`, `CompanyId`) VALUES
(1, 'Jenny', 1),
(2, 'Jenny', 2);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ServiceId` int(11) NOT NULL,
  `ServiceName` text NOT NULL,
  `Cost` int(11) NOT NULL,
  `Duration` int(11) NOT NULL,
  `CompanyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ServiceId`, `ServiceName`, `Cost`, `Duration`, `CompanyId`) VALUES
(1, '60-minute Massage', 70, 60, 1),
(2, '60-minute Facial', 100, 60, 2),
(3, '30-minute Facial', 50, 30, 1),
(4, '90-minute Massage', 150, 90, 1),
(5, '75-Minute Massage', 150, 75, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AppointmentId`),
  ADD KEY `CustomerId` (`CustomerId`),
  ADD KEY `ServiceProviderId` (`ServiceProviderId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`);

--
-- Indexes for table `customerorders`
--
ALTER TABLE `customerorders`
  ADD PRIMARY KEY (`CustomerOrderId`);

--
-- Indexes for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD PRIMARY KEY (`ServiceProviderId`),
  ADD KEY `CompanyId` (`CompanyId`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `AppointmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `CompanyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customerorders`
--
ALTER TABLE `customerorders`
  MODIFY `CustomerOrderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  MODIFY `ServiceProviderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `ServiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`ServiceProviderId`) REFERENCES `serviceprovider` (`ServiceProviderId`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`ServiceId`) REFERENCES `services` (`ServiceId`);

--
-- Constraints for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD CONSTRAINT `serviceprovider_ibfk_1` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`CompanyId`);
  
--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`CompanyId`);
  
  --
-- Constraints for table `customerorderdetails``
--
ALTER TABLE `customerorderdetails`
  ADD CONSTRAINT `customerorderdetails_ibfk_1` FOREIGN KEY (`ServiceId`) REFERENCES `services` (`ServiceId`),
  ADD CONSTRAINT `customerorderdetails_ibfk_2` FOREIGN KEY (`CustomerOrderId`) REFERENCES `customerorders` (`CustomerOrderId`);
  
  
  
  
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
