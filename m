Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1553183239-13253-1-git-send-email-fabien.dessenne@st.com>
 <1553183239-13253-3-git-send-email-fabien.dessenne@st.com>
 <CAH2Cfb8K5hB=UeMOeTEXud1XZVp12Qbw9NYoxJ0XQK4FFuF3wQ@mail.gmail.com>
 <4857555a-812d-0b96-9a70-2984ffb50ca9@st.com> <CAH2Cfb8NzsOZDt8zBypY9ZiD6oOFWUBkZoPpKfU97ZRF_O0z+A@mail.gmail.com>
 <770c71bc-f387-62b6-f799-07ba6446e7e8@st.com>
In-Reply-To: <770c71bc-f387-62b6-f799-07ba6446e7e8@st.com>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Fri, 5 Apr 2019 22:03:24 +0800
Message-ID: <CAH2Cfb87Wacgsh=xz9h9kgwYgBkxNBDbcDJ4W3uPs2LiKbTD9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] tty: add rpmsg driver
Content-Type: text/plain; charset="UTF-8"
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Apr 5, 2019 at 8:33 PM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>
>
>
> On 4/5/19 12:12 PM, xiang xiao wrote:
> > On Fri, Apr 5, 2019 at 12:14 AM Arnaud Pouliquen
> > <arnaud.pouliquen@st.com> wrote:
> >>
> >> Hello Xiang,
> >>
> >>
> >> On 4/3/19 2:47 PM, xiang xiao wrote:
> >>> On Thu, Mar 21, 2019 at 11:48 PM Fabien Dessenne <fabien.dessenne@st.com> wrote:
> >>>>
> >>>> This driver exposes a standard tty interface on top of the rpmsg
> >>>> framework through the "rpmsg-tty-channel" rpmsg service.
> >>>>
> >>>> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> >>>> per rpmsg endpoint.
> >>>>
> >>>
> >>> How to support multi-instances from the same remoteproc instance? I
> >>> saw that the channel name is fixed to "rpmsg-tty-channel" which mean
> >>> only one channel can be created for each remote side.
> >> The driver is multi-instance based on muti-endpoints on top of the
> >> "rpmsg-tty-channel" service.
> >> On remote side you just have to call rpmsg_create_ept with destination
> >> address set to ANY. The result is a NS service announcement that trigs a
> >>  probe with a new endpoint.
> >> You can find code example for the remote side here:
> >> https://github.com/STMicroelectronics/STM32CubeMP1/blob/master/Projects/STM32MP157C-DK2/Applications/OpenAMP/OpenAMP_TTY_echo/Src/main.c
> >
> > Demo code create two uarts(huart0 and huart1), and both use the same
> > channel name( "rpmsg-tty-channel").
> > But rpmsg_create_channel in kernel will complain the duplication:
> > /* make sure a similar channel doesn't already exist */
> > tmp = rpmsg_find_device(dev, chinfo);
> > if (tmp) {
> >         /* decrement the matched device's refcount back */
> >         put_device(tmp);
> >         dev_err(dev, "channel %s:%x:%x already exist\n",
> >                    chinfo->name, chinfo->src, chinfo->dst);
> >         return NULL;
> > }
> > Do you have some local change not upstream yet?
> Nothing is missing. There is no complain as the function
> rpmsg_device_match returns 0, because the chinfo->dst (that corresponds
> to the remote ept address) is different.
>

Yes, you are right.

> If i well remember you have also a similar implementation of the service
> on your side. Do you see any incompatibility with your implementation?
>

Our implementation is similar to yours, but has two major difference:
1.Each instance has a different channel name but share the same prefix
"rpmsg-tty*", the benefit is that:
   a.Device name(/dev/tty*) is derived from rpmsg-tty*, instead the
random /dev/ttyRPMSGx
   b.Don't need tty_idr to allocate the unique device id
2.Each transfer need get response from peer to avoid the buffer
overflow. This is very important if the peer use pull
model(read/write) instead of push model(callback).

Here is the patch for kernel side:
https://github.com/xiaoxiang781216/linux/commit/f04d2386eb11e0781f0eb47d99fae838abf7eb53
https://github.com/xiaoxiang781216/linux/commit/1a41be362d916eb9104bf21065cb38a0a63d2e91

And RTOS side:
https://github.com/PineconeCode/nuttx/blob/song-u1/include/nuttx/serial/uart_rpmsg.h
https://github.com/PineconeCode/nuttx/blob/song-u1/drivers/serial/uart_rpmsg.c

Maybe, we can consider how to unify these two implementation into one.

> >
> >> using some wrapper functions available here:
> >> https://github.com/STMicroelectronics/STM32CubeMP1/tree/master/Middlewares/Third_Party/OpenAMP
> >>
> >>
> >> Best Regards
> >> Arnaud
> >>
> >>>
> >>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >>>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >>>> ---
> >>>>  drivers/tty/Kconfig     |   9 ++
> >>>>  drivers/tty/Makefile    |   1 +
> >>>>  drivers/tty/rpmsg_tty.c | 309 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>>>  3 files changed, 319 insertions(+)
> >>>>  create mode 100644 drivers/tty/rpmsg_tty.c
> >>>>
> >>>> diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
> >>>> index 0840d27..42696e6 100644
> >>>> --- a/drivers/tty/Kconfig
> >>>> +++ b/drivers/tty/Kconfig
> >>>> @@ -441,4 +441,13 @@ config VCC
> >>>>         depends on SUN_LDOMS
> >>>>         help
> >>>>           Support for Sun logical domain consoles.
> >>>> +
> >>>> +config RPMSG_TTY
> >>>> +       tristate "RPMSG tty driver"
> >>>> +       depends on RPMSG
> >>>> +       help
> >>>> +         Say y here to export rpmsg endpoints as tty devices, usually found
> >>>> +         in /dev/ttyRPMSGx.
> >>>> +         This makes it possible for user-space programs to send and receive
> >>>> +         rpmsg messages as a standard tty protocol.
> >>>>  endif # TTY
> >>>> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
> >>>> index c72cafd..90a98a2 100644
> >>>> --- a/drivers/tty/Makefile
> >>>> +++ b/drivers/tty/Makefile
> >>>> @@ -33,5 +33,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
> >>>>  obj-$(CONFIG_GOLDFISH_TTY)     += goldfish.o
> >>>>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
> >>>>  obj-$(CONFIG_VCC)              += vcc.o
> >>>> +obj-$(CONFIG_RPMSG_TTY)                += rpmsg_tty.o
> >>>>
> >>>>  obj-y += ipwireless/
> >>>> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
> >>>> new file mode 100644
> >>>> index 0000000..9c2a629
> >>>> --- /dev/null
> >>>> +++ b/drivers/tty/rpmsg_tty.c
> >>>> @@ -0,0 +1,309 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0
> >>>> +/*
> >>>> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> >>>> + * Authors: Arnaud Pouliquen <arnaud.pouliquen@st.com> for STMicroelectronics.
> >>>> + *          Fabien Dessenne <fabien.dessenne@st.com> for STMicroelectronics.
> >>>> + * Derived from the imx-rpmsg and omap-rpmsg implementations.
> >>>> + */
> >>>> +
> >>>> +#include <linux/module.h>
> >>>> +#include <linux/rpmsg.h>
> >>>> +#include <linux/slab.h>
> >>>> +#include <linux/tty.h>
> >>>> +#include <linux/tty_flip.h>
> >>>> +
> >>>> +#define MAX_TTY_RPMSG          32
> >>>> +
> >>>> +static DEFINE_IDR(tty_idr);            /* tty instance id */
> >>>> +static DEFINE_MUTEX(idr_lock);         /* protects tty_idr */
> >>>> +
> >>>> +static struct tty_driver *rpmsg_tty_driver;
> >>>> +
> >>>> +struct rpmsg_tty_port {
> >>>> +       struct tty_port         port;   /* TTY port data */
> >>>> +       unsigned int            id;     /* TTY rpmsg index */
> >>>> +       spinlock_t              rx_lock; /* message reception lock */
> >>>> +       struct rpmsg_device     *rpdev; /* rpmsg device */
> >>>> +};
> >>>> +
> >>>> +static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len,
> >>>> +                       void *priv, u32 src)
> >>>> +{
> >>>> +       int space;
> >>>> +       unsigned char *cbuf;
> >>>> +       struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
> >>>> +
> >>>> +       dev_dbg(&rpdev->dev, "msg(<- src 0x%x) len %d\n", src, len);
> >>>> +
> >>>> +       print_hex_dump_debug(__func__, DUMP_PREFIX_NONE, 16, 1, data, len,
> >>>> +                            true);
> >>>> +
> >>>> +       /* Flush the recv-ed none-zero data to tty node */
> >>>> +       if (!len)
> >>>> +               return -EINVAL;
> >>>> +
> >>>> +       spin_lock(&cport->rx_lock);
> >>>> +       space = tty_prepare_flip_string(&cport->port, &cbuf, len);
> >>>> +       if (space <= 0) {
> >>>> +               dev_err(&rpdev->dev, "No memory for tty_prepare_flip_string\n");
> >>>> +               spin_unlock(&cport->rx_lock);
> >>>> +               return -ENOMEM;
> >>>> +       }
> >>>> +
> >>>> +       if (space != len)
> >>>> +               dev_warn(&rpdev->dev, "Trunc buffer from %d to %d\n",
> >>>> +                        len, space);
> >>>> +
> >>>> +       memcpy(cbuf, data, space);
> >>>> +       tty_flip_buffer_push(&cport->port);
> >>>> +       spin_unlock(&cport->rx_lock);
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
> >>>> +{
> >>>> +       struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
> >>>> +
> >>>> +       if (!cport) {
> >>>> +               dev_err(tty->dev, "cannot get cport\n");
> >>>> +               return -ENODEV;
> >>>> +       }
> >>>> +
> >>>> +       return tty_port_install(&cport->port, driver, tty);
> >>>> +}
> >>>> +
> >>>> +static int rpmsg_tty_open(struct tty_struct *tty, struct file *filp)
> >>>> +{
> >>>> +       return tty_port_open(tty->port, tty, filp);
> >>>> +}
> >>>> +
> >>>> +static void rpmsg_tty_close(struct tty_struct *tty, struct file *filp)
> >>>> +{
> >>>> +       return tty_port_close(tty->port, tty, filp);
> >>>> +}
> >>>> +
> >>>> +static int rpmsg_tty_write(struct tty_struct *tty, const unsigned char *buf,
> >>>> +                          int total)
> >>>> +{
> >>>> +       int count, ret = 0;
> >>>> +       const unsigned char *tbuf;
> >>>> +       struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
> >>>> +       struct rpmsg_device *rpdev;
> >>>> +       int msg_size;
> >>>> +
> >>>> +       if (!cport) {
> >>>> +               dev_err(tty->dev, "cannot get cport\n");
> >>>> +               return -ENODEV;
> >>>> +       }
> >>>> +
> >>>> +       rpdev = cport->rpdev;
> >>>> +
> >>>> +       dev_dbg(&rpdev->dev, "%s: send message from tty->index = %d\n",
> >>>> +               __func__, tty->index);
> >>>> +
> >>>> +       if (!buf) {
> >>>> +               dev_err(&rpdev->dev, "buf shouldn't be null.\n");
> >>>> +               return -ENOMEM;
> >>>> +       }
> >>>> +
> >>>> +       msg_size = rpmsg_get_buf_payload_size(rpdev->ept);
> >>>> +       if (msg_size < 0)
> >>>> +               return msg_size;
> >>>> +
> >>>> +       count = total;
> >>>> +       tbuf = buf;
> >>>> +       do {
> >>>> +               /* send a message to our remote processor */
> >>>> +               ret = rpmsg_send(rpdev->ept, (void *)tbuf,
> >>>> +                                min(count, msg_size));
> >>>> +               if (ret) {
> >>>> +                       dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
> >>>> +                       return ret;
> >>>> +               }
> >>>> +
> >>>> +               if (count > msg_size) {
> >>>> +                       count -= msg_size;
> >>>> +                       tbuf += msg_size;
> >>>> +               } else {
> >>>> +                       count = 0;
> >>>> +               }
> >>>> +       } while (count > 0);
> >>>> +
> >>>
> >>> We need the flow control(or handshake) here, otherwise it's very easy
> >>> to lose the data if kernel keep send the data as fast as possible.
> >>>
> >>>> +       return total;
> >>>> +}
> >>>> +
> >>>> +static int rpmsg_tty_write_room(struct tty_struct *tty)
> >>>> +{
> >>>> +       struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
> >>>> +
> >>>> +       if (!cport) {
> >>>> +               dev_err(tty->dev, "cannot get cport\n");
> >>>> +               return -ENODEV;
> >>>> +       }
> >>>> +
> >>>> +       /* report the space in the rpmsg buffer */
> >>>> +       return rpmsg_get_buf_payload_size(cport->rpdev->ept);
> >>>> +}
> >>>> +
> >>>> +static const struct tty_operations rpmsg_tty_ops = {
> >>>> +       .install        = rpmsg_tty_install,
> >>>> +       .open           = rpmsg_tty_open,
> >>>> +       .close          = rpmsg_tty_close,
> >>>> +       .write          = rpmsg_tty_write,
> >>>> +       .write_room     = rpmsg_tty_write_room,
> >>>> +};
> >>>> +
> >>>> +struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
> >>>> +{
> >>>> +       struct rpmsg_tty_port *cport;
> >>>> +
> >>>> +       cport = kzalloc(sizeof(*cport), GFP_KERNEL);
> >>>> +       if (!cport)
> >>>> +               return ERR_PTR(-ENOMEM);
> >>>> +
> >>>> +       mutex_lock(&idr_lock);
> >>>> +       cport->id = idr_alloc(&tty_idr, cport, 0, MAX_TTY_RPMSG, GFP_KERNEL);
> >>>> +       mutex_unlock(&idr_lock);
> >>>> +
> >>>> +       if (cport->id < 0) {
> >>>> +               kfree(cport);
> >>>> +               return ERR_PTR(-ENOSPC);
> >>>> +       }
> >>>> +
> >>>> +       return cport;
> >>>> +}
> >>>> +
> >>>> +static void rpmsg_tty_release_cport(struct rpmsg_tty_port *cport)
> >>>> +{
> >>>> +       mutex_lock(&idr_lock);
> >>>> +       idr_remove(&tty_idr, cport->id);
> >>>> +       mutex_unlock(&idr_lock);
> >>>> +
> >>>> +       kfree(cport);
> >>>> +}
> >>>> +
> >>>> +static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
> >>>> +{
> >>>> +       struct rpmsg_tty_port *cport;
> >>>> +       struct device *tty_dev;
> >>>> +       int ret;
> >>>> +
> >>>> +       cport = rpmsg_tty_alloc_cport();
> >>>> +       if (IS_ERR(cport)) {
> >>>> +               dev_err(&rpdev->dev, "failed to alloc tty port\n");
> >>>> +               return PTR_ERR(cport);
> >>>> +       }
> >>>> +
> >>>> +       tty_port_init(&cport->port);
> >>>> +       cport->port.low_latency = cport->port.flags | ASYNC_LOW_LATENCY;
> >>>> +
> >>>> +       tty_dev = tty_port_register_device(&cport->port, rpmsg_tty_driver,
> >>>> +                                          cport->id, &rpdev->dev);
> >>>> +       if (IS_ERR(tty_dev)) {
> >>>> +               dev_err(&rpdev->dev, "failed to register tty port\n");
> >>>> +               ret = PTR_ERR(tty_dev);
> >>>> +               goto err_destroy;
> >>>> +       }
> >>>> +
> >>>> +       spin_lock_init(&cport->rx_lock);
> >>>> +       cport->rpdev = rpdev;
> >>>> +
> >>>> +       dev_set_drvdata(&rpdev->dev, cport);
> >>>> +
> >>>> +       dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x : ttyRPMSG%d\n",
> >>>> +                rpdev->src, rpdev->dst, cport->id);
> >>>> +
> >>>> +       return 0;
> >>>> +
> >>>> +err_destroy:
> >>>> +       tty_port_destroy(&cport->port);
> >>>> +       rpmsg_tty_release_cport(cport);
> >>>> +       return ret;
> >>>> +}
> >>>> +
> >>>> +static void rpmsg_tty_remove(struct rpmsg_device *rpdev)
> >>>> +{
> >>>> +       struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
> >>>> +
> >>>> +       dev_info(&rpdev->dev, "removing rpmsg tty device %d\n", cport->id);
> >>>> +
> >>>> +       /* User hang up to release the tty */
> >>>> +       if (tty_port_initialized(&cport->port))
> >>>> +               tty_port_tty_hangup(&cport->port, false);
> >>>> +
> >>>> +       tty_unregister_device(rpmsg_tty_driver, cport->id);
> >>>> +       tty_port_destroy(&cport->port);
> >>>> +
> >>>> +       rpmsg_tty_release_cport(cport);
> >>>> +}
> >>>> +
> >>>> +static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
> >>>> +       { .name = "rpmsg-tty-channel" },
> >>>> +       { },
> >>>> +};
> >>>> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_tty_id_table);
> >>>> +
> >>>> +static struct rpmsg_driver rpmsg_tty_rpmsg_drv = {
> >>>> +       .drv.name       = KBUILD_MODNAME,
> >>>> +       .id_table       = rpmsg_driver_tty_id_table,
> >>>> +       .probe          = rpmsg_tty_probe,
> >>>> +       .callback       = rpmsg_tty_cb,
> >>>> +       .remove         = rpmsg_tty_remove,
> >>>> +};
> >>>> +
> >>>> +static int __init rpmsg_tty_init(void)
> >>>> +{
> >>>> +       int err;
> >>>> +
> >>>> +       rpmsg_tty_driver = tty_alloc_driver(MAX_TTY_RPMSG, TTY_DRIVER_REAL_RAW |
> >>>> +                                           TTY_DRIVER_DYNAMIC_DEV);
> >>>> +       if (IS_ERR(rpmsg_tty_driver))
> >>>> +               return PTR_ERR(rpmsg_tty_driver);
> >>>> +
> >>>> +       rpmsg_tty_driver->driver_name = "rpmsg_tty";
> >>>> +       rpmsg_tty_driver->name = "ttyRPMSG";
> >>>> +       rpmsg_tty_driver->major = 0;
> >>>> +       rpmsg_tty_driver->type = TTY_DRIVER_TYPE_CONSOLE;
> >>>> +       rpmsg_tty_driver->init_termios = tty_std_termios;
> >>>> +
> >>>> +       tty_set_operations(rpmsg_tty_driver, &rpmsg_tty_ops);
> >>>> +
> >>>> +       err = tty_register_driver(rpmsg_tty_driver);
> >>>> +       if (err < 0) {
> >>>> +               pr_err("Couldn't install rpmsg tty driver: err %d\n", err);
> >>>> +               goto error_put;
> >>>> +       }
> >>>> +
> >>>> +       err = register_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
> >>>> +       if (err < 0) {
> >>>> +               pr_err("Couldn't register rpmsg tty driver: err %d\n", err);
> >>>> +               goto error_unregister;
> >>>> +       }
> >>>> +
> >>>> +       return 0;
> >>>> +
> >>>> +error_unregister:
> >>>> +       tty_unregister_driver(rpmsg_tty_driver);
> >>>> +
> >>>> +error_put:
> >>>> +       put_tty_driver(rpmsg_tty_driver);
> >>>> +
> >>>> +       return err;
> >>>> +}
> >>>> +
> >>>> +static void __exit rpmsg_tty_exit(void)
> >>>> +{
> >>>> +       unregister_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
> >>>> +       tty_unregister_driver(rpmsg_tty_driver);
> >>>> +       put_tty_driver(rpmsg_tty_driver);
> >>>> +       idr_destroy(&tty_idr);
> >>>> +}
> >>>> +
> >>>> +module_init(rpmsg_tty_init);
> >>>> +module_exit(rpmsg_tty_exit);
> >>>> +
> >>>> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> >>>> +MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
> >>>> +MODULE_DESCRIPTION("virtio remote processor messaging tty driver");
> >>>> +MODULE_LICENSE("GPL v2");
> >>>> --
> >>>> 2.7.4
> >>>>
