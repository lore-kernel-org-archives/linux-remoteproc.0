Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 25 Jun 2017 14:36:30 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: cleanup incorrect function in dev_err message
Message-ID: <20170625213630.GG26155@builder>
References: <1496403365-32328-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496403365-32328-1-git-send-email-henri.roosen@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 02 Jun 04:36 PDT 2017, Henri Roosen wrote:

> Trivial cleanup for incorrect function in dev_err message
> 
> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>

Applied, thanks

> ---
>  drivers/rpmsg/rpmsg_char.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 0ca2ccc..0b5d0d3 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -390,7 +390,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  
>  	ret = device_add(dev);
>  	if (ret) {
> -		dev_err(dev, "device_register failed: %d\n", ret);
> +		dev_err(dev, "device_add failed: %d\n", ret);
>  		put_device(dev);
>  	}
>  
> @@ -505,7 +505,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  
>  	ret = device_add(dev);
>  	if (ret) {
> -		dev_err(&rpdev->dev, "device_register failed: %d\n", ret);
> +		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
>  		put_device(dev);
>  	}
>  
> -- 
> 2.1.4
> 
