Return-Path: <baolin.wang@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170516191801.GA12920@tuxbook>
References: <f951b1c5aca85b4f1aa23fbf8a24ed315439bb58.1494914340.git.baolin.wang@spreadtrum.com>
 <20170516191801.GA12920@tuxbook>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Wed, 17 May 2017 10:54:40 +0800
Message-ID: <CAMz4kuJo9b2jLPueyyk11gcPHuNrsjsZa7eJFEnR7y4O2oBDbw@mail.gmail.com>
Subject: Re: [PATCH] hwspinlock: sprd: Add hardware spinlock driver
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, LKML <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org, Mark Brown <broonie@kernel.org>, baolin.wang@spreadtrum.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 17 May 2017 at 03:18, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> On Tue 16 May 00:54 PDT 2017, Baolin Wang wrote:
>
>> diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
>> index 6b59cb5a..03c442f 100644
>> --- a/drivers/hwspinlock/Makefile
>> +++ b/drivers/hwspinlock/Makefile
>> @@ -7,3 +7,4 @@ obj-$(CONFIG_HWSPINLOCK_OMAP)         += omap_hwspinlock.o
>>  obj-$(CONFIG_HWSPINLOCK_QCOM)                += qcom_hwspinlock.o
>>  obj-$(CONFIG_HWSPINLOCK_SIRF)                += sirf_hwspinlock.o
>>  obj-$(CONFIG_HSEM_U8500)             += u8500_hsem.o
>> +obj-$(CONFIG_HWSPINLOCK_SPRD)                += sprd_hwspinlock.o
>
> Please move this one line up, to keep the alphabetical sort order
> (please make sure to update the order in Kconfig accordingly).

OK.

>
>> diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
>> new file mode 100644
>> index 0000000..898738f
>> --- /dev/null
>> +++ b/drivers/hwspinlock/sprd_hwspinlock.c
>> @@ -0,0 +1,243 @@
>> +/*
>> + * Spreadtrum hardware spinlock driver
>> + * Copyright (C) 2017 Spreadtrum  - http://www.spreadtrum.com
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, but
>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * General Public License for more details.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/hwspinlock.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>
> I don't see a need for spinlock.h

Will remove it.

>
>> +
>> +#include "hwspinlock_internal.h"
>> +
>> +/* hwspinlock registers definition */
>> +#define HWSPINLOCK_RECCTRL           0x4
>> +#define HWSPINLOCK_TTLSTS            0x8
>> +#define HWSPINLOCK_FLAG0             0x10
>> +#define HWSPINLOCK_FLAG1             0x14
>> +#define HWSPINLOCK_FLAG2             0x18
>> +#define HWSPINLOCK_FLAG3             0x1c
>
> These flags are unused.

These may be used in future, but I will remove them now.

>
>> +#define HWSPINLOCK_MASTERID(_X_)     (0x80 + 0x4 * (_X_))
>> +#define HWSPINLOCK_TOKEN(_X_)                (0x800 + 0x4 * (_X_))
>> +#define HWSPINLOCK_VERID             0xFFC
>
> verid is unused.

Will remove it.

>
>> +
>> +/* untoken lock value */
>
> untaken? Perhaps "unlocked value" instead?

OK.

>
>> +#define HWSPINLOCK_NOTTAKEN          0x55aa10c5
>> +/* bits definition of RECCTRL reg */
>> +#define HWSPINLOCK_ID                        0x0
>
> id is unused.

Will remove it now.

>
>> +#define HWSPINLOCK_USER_BITS         0x1
>> +
>> +/* hwspinlock number */
>> +#define SPRD_HWLOCKS_NUM             32
>> +
>> +struct sprd_hwspinlock_dev {
>> +     void __iomem *base;
>> +     struct clk *clk;
>> +     unsigned char status[SPRD_HWLOCKS_NUM];
>> +     struct hwspinlock_device bank;
>> +};
>> +
>> +static const struct of_device_id sprd_hwspinlock_of_match[] = {
>> +     { .compatible = "sprd,hwspinlock-r3p0",},
>> +     { /* sentinel */ }
>> +};
>
> Please move this next to the definition of sprd_hwspinlock_driver and
> add the missing MODULE_DEVICE_TABLE(of, sprd_hwspinlock_of_match);

OK.

>
>> +
>> +static struct sprd_hwspinlock_dev *sprd_lock_to_dev(struct hwspinlock *lock)
>> +{
>> +     struct hwspinlock_device *hwbank;
>> +     unsigned int lock_id = hwlock_to_id(lock);
>> +
>> +     hwbank = container_of(lock, struct hwspinlock_device, lock[lock_id]);
>> +     return container_of(hwbank, struct sprd_hwspinlock_dev, bank);
>
> As you platform_set_drvdata the sprd_hwspinlock_dev in probe you can
> implement this with function with
>
> return dev_get_drvdata(lock->bank->dev);

Yes, you are correct, and I will change it.

>
>> +}
>> +
>> +/* set the hardware spinlock record type */
>> +static void sprd_set_hwspinlock_record(struct sprd_hwspinlock_dev *sprd_hwlock,
>> +                                    unsigned int type)
>> +{
>> +     writel_relaxed(type, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
>
> Please use writel() and please inline this write into the probe function.

OK.

>
>> +}
>> +
>> +/* get the hardware spinlock master/user id */
>> +static unsigned int sprd_get_hwspinlock_id(struct sprd_hwspinlock_dev *sprd_hwlock,
>> +                                        unsigned int lock_id)
>> +{
>> +     return readl_relaxed(sprd_hwlock->base + HWSPINLOCK_MASTERID(lock_id));
>
> Please use readl() and please inline this function in
> sprd_hwspinlock_trylock()

OK.

>
>> +}
>> +
>> +/* record the hardware spinlock status */
>> +static int sprd_record_hwspinlock_sts(struct hwspinlock *lock)
>
> The hwlock->status is not read by anyone, so please remove this
> function.

Sometime we will dump memory to analyze the status of hardware
spinlocks, but if you still complain that I will remove it.

>
>> +{
>> +     struct sprd_hwspinlock_dev *sprd_hwlock = sprd_lock_to_dev(lock);
>> +     unsigned int lock_id = hwlock_to_id(lock);
>> +     unsigned char status;
>> +
>> +     if (lock_id >= SPRD_HWLOCKS_NUM) {
>> +             dev_err(sprd_hwlock->bank.dev, "lock id is out of the range\n");
>> +             return -ENXIO;
>> +     }
>> +
>> +     /* get the hardware spinlock status */
>> +     status = !!(readl_relaxed(sprd_hwlock->base + HWSPINLOCK_TTLSTS) &
>> +                 BIT(lock_id));
>> +
>> +     sprd_hwlock->status[lock_id] = status;
>> +     return 0;
>> +}
>> +
>> +/* try to lock the hardware spinlock */
>> +static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
>> +{
>> +     struct sprd_hwspinlock_dev *sprd_hwlock = sprd_lock_to_dev(lock);
>> +     void __iomem *addr = lock->priv;
>> +
>> +     if (!readl_relaxed(addr))
>> +             goto locked;
>
> Please use readl() and as sprd_record_hwspinlock_sts() doesn't seem to
> be needed, return 1 here.

OK.

>
>> +
>> +     dev_warn(sprd_hwlock->bank.dev,
>> +              "hwspinlock [%d] lock failed and master/user id = %d!\n",
>> +              hwlock_to_id(lock),
>> +              sprd_get_hwspinlock_id(sprd_hwlock, hwlock_to_id(lock)));
>
> Please use local variables, rather than calling these functions in the
> parameter list.

OK.

>
>> +     return 0;
>> +
>> +locked:
>> +     sprd_record_hwspinlock_sts(lock);
>> +     return 1;
>> +}
>> +
>> +/* unlock the hardware spinlock */
>> +static void sprd_hwspinlock_unlock(struct hwspinlock *lock)
>> +{
>> +     void __iomem *lock_addr = lock->priv;
>> +
>> +     writel_relaxed(HWSPINLOCK_NOTTAKEN, lock_addr);
>
> Please use writel()
>
>> +     sprd_record_hwspinlock_sts(lock);
>> +}
>> +
>> +/* The specs recommended below number as the retry delay time */
>> +static void sprd_hwspinlock_relax(struct hwspinlock *lock)
>> +{
>> +     ndelay(10);
>> +}
>> +
>> +static const struct hwspinlock_ops sprd_hwspinlock_ops = {
>> +     .trylock = sprd_hwspinlock_trylock,
>> +     .unlock = sprd_hwspinlock_unlock,
>> +     .relax = sprd_hwspinlock_relax,
>> +};
>> +
>> +static int sprd_hwspinlock_probe(struct platform_device *pdev)
>> +{
>> +     struct sprd_hwspinlock_dev *sprd_hwlock;
>> +     struct hwspinlock *lock;
>> +     struct resource *res;
>> +     int i, ret;
>> +
>> +     if (!pdev->dev.of_node)
>> +             return -ENODEV;
>> +
>> +     sprd_hwlock = devm_kzalloc(&pdev->dev,
>> +                                sizeof(struct sprd_hwspinlock_dev) +
>> +                                SPRD_HWLOCKS_NUM * sizeof(*lock),
>> +                                GFP_KERNEL);
>> +     if (!sprd_hwlock)
>> +             return -ENOMEM;
>> +
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     sprd_hwlock->base = devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(sprd_hwlock->base))
>> +             return PTR_ERR(sprd_hwlock->base);
>> +
>> +     sprd_hwlock->clk = of_clk_get_by_name(pdev->dev.of_node, "enable");
>
> Please use devm_clk_get(&pdev->dev, "enable");

OK.

>
>> +     if (IS_ERR(sprd_hwlock->clk)) {
>> +             dev_err(&pdev->dev, "get hwspinlock clock failed!\n");
>> +             return PTR_ERR(sprd_hwlock->clk);
>> +     }
>> +
>> +     clk_prepare_enable(sprd_hwlock->clk);
>> +
>> +     /* set the hwspinlock to record user id to identify subsystems */
>> +     sprd_set_hwspinlock_record(sprd_hwlock, HWSPINLOCK_USER_BITS);
>> +
>> +     for (i = 0; i < SPRD_HWLOCKS_NUM; i++) {
>> +             lock = &sprd_hwlock->bank.lock[i];
>> +             lock->priv = sprd_hwlock->base + HWSPINLOCK_TOKEN(i);
>> +     }
>> +
>> +     platform_set_drvdata(pdev, sprd_hwlock);
>> +     pm_runtime_enable(&pdev->dev);
>> +
>> +     ret = hwspin_lock_register(&sprd_hwlock->bank, &pdev->dev,
>> +                                &sprd_hwspinlock_ops, 0, SPRD_HWLOCKS_NUM);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "hwspinlock register failed!\n");
>
> All error paths of hwspin_lock_register() will cause a log print already.

Will remove the error info.

>
>> +             pm_runtime_disable(&pdev->dev);
>> +             clk_disable_unprepare(sprd_hwlock->clk);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int sprd_hwspinlock_remove(struct platform_device *pdev)
>> +{
>> +     struct sprd_hwspinlock_dev *sprd_hwlock = platform_get_drvdata(pdev);
>> +     int ret;
>> +
>> +     ret = hwspin_lock_unregister(&sprd_hwlock->bank);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "hwspinlock unregister failed: %d\n", ret);
>
> All errors in hwspin_lock_unregister() will cause log prints.

OK.

>
>> +             return ret;
>
> You don't want to return early from a platform_driver remove function,
> the caller ignores this and you will just leak resources.

Yes, will ignore the return value from hwspin_lock_unregister().

>
>> +     }
>> +
>> +     pm_runtime_disable(&pdev->dev);
>> +     clk_disable_unprepare(sprd_hwlock->clk);
>> +     return 0;
>> +}
>> +
>> +static struct platform_driver sprd_hwspinlock_driver = {
>> +     .probe = sprd_hwspinlock_probe,
>> +     .remove = sprd_hwspinlock_remove,
>> +     .driver = {
>> +             .name = "sprd_hwspinlock",
>> +             .owner = THIS_MODULE,
>
> No need to set .owner in platform_drivers anymore.

OK. Very appreciate for your comments. Thanks.

-- 
Baolin.wang
Best Regards
