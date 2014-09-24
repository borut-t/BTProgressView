Purpose
--------------

BTProgressView is a drop-in class replacement for default iOS UIProgressView component.


Installation
--------------

To use the BTProgressView in an app, just drag the BTProgressView class files into your project.


Properties
--------------

The BTProgressView has the following properties:

    @property (nonatomic, assign) CGFloat progress;

The current progress.

    @property (nonatomic, strong) UIColor *progressTintColor;

The color shown for the portion of the progress bar that is filled.

    @property (nonatomic, strong) UIImage *progressImage;

An image to use for the portion of the progress bar that is filled.

    @property (nonatomic, strong) UIColor *progressHandleColor;

Progress handle view. If color is not defined, handle is not drawn.

    @property (nonatomic, strong) UIColor *trackTintColor;

The color shown for the portion of the progress bar that is not filled.

    @property (nonatomic, strong) UIImage *trackImage;

An image to use for the portion of the track that is not filled.

    @property (nonatomic, assign) BOOL isRightToLeft;

If YES progress goes from right-to-left, otherwise from left-to-right. Default to NO.