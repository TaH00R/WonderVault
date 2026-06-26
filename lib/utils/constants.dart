// App
const String appName = 'WonderVault';

// Storage Keys
const String accessToken = 'accessToken';
const String refreshToken = 'refreshToken';
const String loginTime = 'loginTime';
const String expirationDuration = 'expirationDuration';
const String themeMode = 'themeMode';

// Validation Messages
const String emptyFieldErrMessage = 'This field cannot be empty';
const String invalidEmailErrMessage = 'Please enter a valid email';
const String passwordMismatchErrMessage = 'Passwords do not match';
const String selectLocationErrMessage = 'Please select a location';
const String selectImageErrMessage = 'Please select at least one image';

// Routes
const String routeNameSplashPage = 'splash';
const String routeNameLoginPage = 'login';
const String routeNameRegisterPage = 'register';
const String routeNameHomePage = 'home';
const String routeNameMapPage = 'map';
const String routeNameProfilePage = 'profile';
const String routeNameMemoryDetailsPage = 'memory_details';
const String routeNameCreateMemoryPage = 'create_memory';
const String routeNameEditMemoryPage = 'edit_memory';
const String routeNameSettingsPage = 'settings';

// Memory Visibility
const String visibilityPublic = 'Public';
const String visibilityPrivate = 'Private';
const String visibilityFriends = 'Friends';

const memoryVisibilityOptions = [
  visibilityPublic,
  visibilityFriends,
  visibilityPrivate,
];

// Memory Categories
const String categoryNature = 'Nature';
const String categoryFood = 'Food';
const String categoryAdventure = 'Adventure';
const String categoryBeach = 'Beach';
const String categoryMountains = 'Mountains';
const String categoryCity = 'City';
const String categoryRoadTrip = 'Road Trip';
const String categoryHistorical = 'Historical';
const String categoryCamping = 'Camping';
const String categoryOther = 'Other';

const memoryCategories = [
  categoryNature,
  categoryFood,
  categoryAdventure,
  categoryBeach,
  categoryMountains,
  categoryCity,
  categoryRoadTrip,
  categoryHistorical,
  categoryCamping,
  categoryOther,
];

// Response Status
enum ResponseStatus {
  saved,
  updated,
  deleted,
  failed,
  unauthorized,
  authorized,
  expired,
  error,
  none,
}

// Map Defaults
const double defaultLatitude = 20.5937;
const double defaultLongitude = 78.9629;
const double defaultZoom = 5.0;

// Image Limits
const int maxImagesPerMemory = 10;

// Supported Image Extensions
const supportedImageExtensions = [
  'jpg',
  'jpeg',
  'png',
  'webp',
];

// Common Tags
const popularTags = [
  'Sunset',
  'Hiking',
  'Vacation',
  'Family',
  'Friends',
  'Solo',
  'Nature',
  'Food',
  'Beach',
  'Mountains',
  'City',
];