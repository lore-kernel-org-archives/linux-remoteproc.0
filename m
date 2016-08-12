Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 12 Aug 2016 12:06:41 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RFC 1/3] hwspinlock: sun8i: add Allwinner sun8i HardWare
 Spinlock
Message-ID: <20160812190641.GI26240@tuxbot>
References: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 12 Aug 04:46 PDT 2016, LABBE Corentin wrote:

> Add hwspinlock support for the Allwinner Hardware Spinlock device
> present on the A83T, H3 and A64 SoCs.
> 
> This Hardware Spinlock device provides hardware assistance
> for synchronization between the multiple processors in the system.
> 
[..]
> diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
> index 6b59cb5a..2ac59ae 100644
> --- a/drivers/hwspinlock/Makefile
> +++ b/drivers/hwspinlock/Makefile
> @@ -5,5 +5,6 @@
>  obj-$(CONFIG_HWSPINLOCK)		+= hwspinlock_core.o
>  obj-$(CONFIG_HWSPINLOCK_OMAP)		+= omap_hwspinlock.o
>  obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
> +obj-$(CONFIG_HWSPINLOCK_SUN8I)		+= sun8i_hwspinlock.o

Please move this below sirf, to keep consistent with Kconfig and
(mostly) in alphabetical order.

>  obj-$(CONFIG_HWSPINLOCK_SIRF)		+= sirf_hwspinlock.o
>  obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
> diff --git a/drivers/hwspinlock/sun8i_hwspinlock.c b/drivers/hwspinlock/sun8i_hwspinlock.c
> new file mode 100644
> index 0000000..e2d2a0c
> --- /dev/null
> +++ b/drivers/hwspinlock/sun8i_hwspinlock.c
> @@ -0,0 +1,235 @@
> +/*
> + * Allwinner sun8i hardware spinlock driver
> + *
> + * Copyright (C) 2016 Corentin LABBE <clabbe.montjoie@gmail.com>
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>

Unused.

> +#include <linux/hwspinlock.h>
> +#include <linux/io.h>
> +#include <linux/bitops.h>

Unused.

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>

Unused.

> +#include <linux/reset.h>
> +
> +#include "hwspinlock_internal.h"
> +
> +/* Spinlock register offsets */
> +#define SYSSTATUS_OFFSET		0x0000
> +#define LOCK_BASE_OFFSET		0x0100
> +
> +/* Possible values of SPINLOCK_LOCK_REG */
> +#define SPINLOCK_NOTTAKEN		0	/* free */
> +#define SPINLOCK_TAKEN			1	/* locked */

Although nice as a way to document the behavior, I think you should just
go with a single:

#define SPINLOCK_FREE 0

And skip the unused define (calling it free saves you the comment as
well).

> +
> +struct sun8i_hwspinlock_device {
> +	void __iomem *base;
> +	int num_locks;

base and num_locks are local to probe, keep them local there.

> +	struct hwspinlock_device *bank;
> +	struct reset_control *rst;
> +	struct clk *ahb_clk;
> +};
> +
> +struct sun8i_hwspinlock {
> +	void __iomem *base;
> +};

Unless you think there will be other parts to this, I think you should
just use lock->priv directly for the base pointer.

> +
> +static int sun8i_hwspinlock_trylock(struct hwspinlock *lock)
> +{
> +	struct sun8i_hwspinlock *priv = lock->priv;
> +	void __iomem *lock_addr = priv->base;
> +
> +	/* attempt to acquire the lock by reading its value */
> +	return (readl(lock_addr) == SPINLOCK_NOTTAKEN);

Unnecessary outer parenthesis.

> +}
> +
> +static void sun8i_hwspinlock_unlock(struct hwspinlock *lock)
> +{
> +	struct sun8i_hwspinlock *priv = lock->priv;
> +	void __iomem *lock_addr = priv->base;
> +
> +	/* release the lock by writing 0 to it */
> +	writel(SPINLOCK_NOTTAKEN, lock_addr);
> +}
> +
> +static const struct hwspinlock_ops sun8i_hwspinlock_ops = {
> +	.trylock = sun8i_hwspinlock_trylock,
> +	.unlock = sun8i_hwspinlock_unlock,
> +};
> +
> +static int sun8i_hwspinlock_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct hwspinlock *hwlock;
> +	struct resource *res;
> +	int i, err;
> +	struct sun8i_hwspinlock_device *priv;
> +	struct sun8i_hwspinlock *hpriv;
> +	size_t array_size;
> +
> +	if (!node)
> +		return -ENODEV;

node is unused, so you can drop it.

> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;

devm_ioremap_resource() fails nicely if res is NULL, so please move this
down to that call and drop the error check on res.

> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->base = devm_ioremap_resource(&pdev->dev, res);

Again, I think you should make base a local variable in this function.

> +	if (IS_ERR(priv->base)) {
> +		err = PTR_ERR(priv->base);
> +		dev_err(&pdev->dev, "Cannot request MMIO %d\n", err);

All error paths of devm_ioremap_resource() will print an error message,
so you don't have to.

> +		return err;
> +	}
> +
> +	priv->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
> +	if (IS_ERR(priv->ahb_clk)) {
> +		err = PTR_ERR(priv->ahb_clk);
> +		dev_err(&pdev->dev, "Cannot get AHB clock err=%d\n", err);
> +		return err;
> +	}
> +
> +	priv->rst = devm_reset_control_get_optional(&pdev->dev, "ahb");
> +	if (IS_ERR(priv->rst)) {
> +		err = PTR_ERR(priv->rst);
> +		if (err == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		dev_info(&pdev->dev, "No optional reset control found %d\n",
> +			 err);
> +		priv->rst = NULL;
> +	}
> +
> +	if (priv->rst) {
> +		err = reset_control_deassert(priv->rst);
> +		if (err) {
> +			dev_err(&pdev->dev, "Cannot deassert reset control\n");
> +			return err;
> +		}
> +	}
> +
> +	err = clk_prepare_enable(priv->ahb_clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "Cannot prepare AHB clock %d\n", err);
> +		goto rst_fail;
> +	}
> +
> +	/* Determine number of locks */
> +	i = readl(priv->base + SYSSTATUS_OFFSET);
> +	i >>= 28;

Please use an unsigned int here instead, to avoid sign extension.

> +
> +	switch (i) {
> +	case 0x1:
> +		priv->num_locks = 32;
> +		break;
> +	case 0x2:
> +		priv->num_locks = 64;
> +		break;
> +	case 0x3:
> +		priv->num_locks = 128;
> +		break;
> +	case 0x4:
> +		priv->num_locks = 256;
> +		break;
> +	default:
> +		dev_err(&pdev->dev, "Invalid number of spinlocks %d\n", i);
> +		err = -EINVAL;
> +		goto clk_fail;
> +	}
> +
> +	array_size = sizeof(*priv->bank) + priv->num_locks * sizeof(*hwlock);
> +	priv->bank = devm_kzalloc(&pdev->dev, array_size, GFP_KERNEL);
> +	if (!priv->bank) {
> +		err = -ENOMEM;
> +		goto clk_fail;
> +	}
> +
> +	for (i = 0, hwlock = &priv->bank->lock[0]; i < priv->num_locks;
> +		i++, hwlock++) {

If you bring hwlock modification inside the loop you don't have to line
wrap the for statement.

for (i = 0; i < num_locks; i++) {
	hwlock = &priv->bank->lock[i];

> +		hwlock->priv = devm_kzalloc(&pdev->dev,
> +					    sizeof(struct sun8i_hwspinlock),
> +					    GFP_KERNEL);
> +		if (!hwlock->priv) {
> +			err = -ENOMEM;
> +			goto clk_fail;
> +		}
> +		hpriv = hwlock->priv;
> +		hpriv->base = priv->base + LOCK_BASE_OFFSET + sizeof(u32) * i;

Please store the address directly in hwlock->priv

> +	}
> +
> +	err = hwspin_lock_register(priv->bank, &pdev->dev,
> +				   &sun8i_hwspinlock_ops, 0, priv->num_locks);
> +	if (err) {
> +		dev_err(&pdev->dev, "Cannot register hwspinlock");

hwspin_lock_register() will already have printed a more specific line in
the log.

> +		goto clk_fail;
> +	}
> +
> +	dev_info(&pdev->dev, "Sun8i hwspinlock driver loaded with %d locks\n",
> +		 priv->num_locks);

Please don't advertise the driver on success.

> +	return 0;
> +
> +clk_fail:
> +	clk_disable_unprepare(priv->ahb_clk);
> +rst_fail:
> +	if (priv->rst)
> +		reset_control_assert(priv->rst);
> +	return err;
> +}
> +
> +static int sun8i_hwspinlock_remove(struct platform_device *pdev)
> +{
> +	struct sun8i_hwspinlock_device *priv = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = hwspin_lock_unregister(priv->bank);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);

hwspin_lock_unregister() will already have printed to the log, no need
for you to repeat that.

> +		return ret;

Unfortunately no-one cares about this return value, the device will be
removed no matter what you return. So please just go on with it...

> +	}
> +	if (priv->rst)
> +		reset_control_assert(priv->rst);
> +
> +	clk_disable_unprepare(priv->ahb_clk);

In the failure path of probe() you disable clocks before reset, are
there any dependencies between them or is the ordering here ok?

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sun8i_hwspinlock_of_match[] = {
> +	{ .compatible = "allwinner,sun8i-hwspinlock", },
> +	{ /* end */ },
> +};
> +MODULE_DEVICE_TABLE(of, sun8i_hwspinlock_of_match);
> +
> +static struct platform_driver sun8i_hwspinlock_driver = {
> +	.probe		= sun8i_hwspinlock_probe,
> +	.remove		= sun8i_hwspinlock_remove,
> +	.driver		= {
> +		.name	= "sun8i_hwspinlock",
> +		.of_match_table = of_match_ptr(sun8i_hwspinlock_of_match),

You can skip the of_match_ptr() here, with votes 1518 to 627 in
v4.8-rc1.

> +	},
> +};
> +
> +static int __init sun8i_hwspinlock_init(void)
> +{
> +	return platform_driver_register(&sun8i_hwspinlock_driver);
> +}
> +/* board init code might need to reserve hwspinlocks for predefined purposes */
> +postcore_initcall(sun8i_hwspinlock_init);
> +
> +static void __exit sun8i_hwspinlock_exit(void)
> +{
> +	platform_driver_unregister(&sun8i_hwspinlock_driver);
> +}
> +module_exit(sun8i_hwspinlock_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Hardware spinlock driver for Allwinner sun8i");
> +MODULE_AUTHOR("Corentin LABBE <clabbe.montjoie@gmail.com>");

Regards,
Bjorn
