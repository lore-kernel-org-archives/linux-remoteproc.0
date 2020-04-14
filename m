Date: Tue, 14 Apr 2020 15:58:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3,0/3] drivers: rpmon: new driver Remote Processor
 Monitor
Message-ID: <20200414225823.GH892431@yoga>
References: <20200412112405.24116-1-wenhu.wang@vivo.com>
 <20200414035949.107225-1-wenhu.wang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414035949.107225-1-wenhu.wang@vivo.com>
To: Wang Wenhu <wenhu.wang@vivo.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org, kernel@vivo.com, agross@kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 13 Apr 20:59 PDT 2020, Wang Wenhu wrote:

> RPMON is a driver framework. It supports remote processor monitor
> from user level. The basic components are a character device
> with sysfs interfaces for user space communication and different
> kinds of message drivers introduced modularly, which are used to
> communicate with remote processors.
> 
> As for user space, one can get notifications of different events
> of remote processors, like their registrations, through standard
> file read operation of the file descriptors related to the exported
> character devices. Actions can also be taken into account via
> standard write operations to the devices. Besides, the sysfs class
> attributes could be accessed conveniently.
> 
> Message drivers act as engines to communicate with remote processors.
> Currently RPMON_QMI is available which uses QMI infrastructures
> on Qualcomm SoC Platforms.
> 
> RPMON_QMI implements a kind of communication routine for RPMON to
> communicate with remote processors through QMI infrastructure.
> RPMON_QMI itself is designed as a modular framework that would
> introduce different kind of message sets which are binding to
> different services.
> 
> RPMON_QMI creates a device of rpmon_device type for each remote
> processor endpoint. All the endpoint devices share an unique set
> of QMI suite.
> 
> RPMON_QMI_MSG_V01 implements a RPMON_QMI message set for connection check.
> RPMON_QMI defines its message types modularly. Each rpmon service
> binds to a message set and introduced as a module. This version 1.0
> message set could be used for connection checking of remote processors.
> 
> RPMON_QMI messages depend on QCOM_QMI_HELPERS and should be updated
> together with QMI related modules.
> 

Hi Wang,

What additional transports do you expect for this to be a framework and
not just a driver? Why not implement the rpmon client directly in
userspace?

Regards,
Bjorn

> Changes since v1:
>  - Addressed review comments from Randy
> Changes since v2:
>  - Added Cc list
>  - Commit log typo fixing
>  - Use the ARRAY_SIZE instead of calculations of multiple sizeof()
>  - Use micros for qmi message tly_type fields
> 
> Wang Wenhu (3):
>   driver: rpmon: new driver Remote Processor Monitor
>   driver: rpmon: qmi message version 01
>   driver: rpmon: add rpmon_qmi driver
> 
>  drivers/Kconfig                  |   2 +
>  drivers/Makefile                 |   1 +
>  drivers/rpmon/Kconfig            |  54 ++++
>  drivers/rpmon/Makefile           |   3 +
>  drivers/rpmon/rpmon.c            | 506 +++++++++++++++++++++++++++++++
>  drivers/rpmon/rpmon_qmi.c        | 431 ++++++++++++++++++++++++++
>  drivers/rpmon/rpmon_qmi.h        |  76 +++++
>  drivers/rpmon/rpmon_qmi_msg_v1.c | 258 ++++++++++++++++
>  include/linux/rpmon.h            |  68 +++++
>  9 files changed, 1399 insertions(+)
>  create mode 100644 drivers/rpmon/Kconfig
>  create mode 100644 drivers/rpmon/Makefile
>  create mode 100644 drivers/rpmon/rpmon.c
>  create mode 100644 drivers/rpmon/rpmon_qmi.c
>  create mode 100644 drivers/rpmon/rpmon_qmi.h
>  create mode 100644 drivers/rpmon/rpmon_qmi_msg_v1.c
>  create mode 100644 include/linux/rpmon.h
> 
> -- 
> 2.17.1
> 
