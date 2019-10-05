Date: Fri, 4 Oct 2019 21:11:23 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/4] hwspinlock: sprd: Use devm_hwspin_lock_register() to
 register hwlock controller
Message-ID: <20191005041120.GD5189@tuxbook-pro>
References: <cover.1569567749.git.baolin.wang@linaro.org>
 <e8f1db04571f62298c7a4f72be803b9b9974d12d.1569567749.git.baolin.wang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8f1db04571f62298c7a4f72be803b9b9974d12d.1569567749.git.baolin.wang@linaro.org>
To: Baolin Wang <baolin.wang@linaro.org>
Cc: ohad@wizery.com, orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 27 Sep 00:10 PDT 2019, Baolin Wang wrote:

> Use devm_hwspin_lock_register() to register the hwlock controller instead of
> unregistering the hwlock controller explicitly when removing the device.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Thanks Baolin, series applied.

Regards,
Bjorn

> ---
>  drivers/hwspinlock/sprd_hwspinlock.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
> index e76c702..44d69db 100644
> --- a/drivers/hwspinlock/sprd_hwspinlock.c
> +++ b/drivers/hwspinlock/sprd_hwspinlock.c
> @@ -135,8 +135,9 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, sprd_hwlock);
>  	pm_runtime_enable(&pdev->dev);
>  
> -	ret = hwspin_lock_register(&sprd_hwlock->bank, &pdev->dev,
> -				   &sprd_hwspinlock_ops, 0, SPRD_HWLOCKS_NUM);
> +	ret = devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
> +					&sprd_hwspinlock_ops, 0,
> +					SPRD_HWLOCKS_NUM);
>  	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
>  		return ret;
> @@ -147,9 +148,6 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
>  
>  static int sprd_hwspinlock_remove(struct platform_device *pdev)
>  {
> -	struct sprd_hwspinlock_dev *sprd_hwlock = platform_get_drvdata(pdev);
> -
> -	hwspin_lock_unregister(&sprd_hwlock->bank);
>  	pm_runtime_disable(&pdev->dev);
>  	return 0;
>  }
> -- 
> 1.7.9.5
> 
