Return-Path: <wenhu.wang@vivo.com>
From: Wang Wenhu <wenhu.wang@vivo.com>
Subject: Re: [PATCH v3,0/3] drivers: rpmon: new driver Remote Processor Monitor
Date: Wed, 15 Apr 2020 08:16:49 -0700
Message-Id: <20200415151649.122787-1-wenhu.wang@vivo.com>
In-Reply-To: <20200414225823.GH892431@yoga>
References: <20200414225823.GH892431@yoga>
To: bjorn.andersson@linaro.org
Cc: agross@kernel.org, gregkh@linuxfoundation.org, kernel@vivo.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, rdunlap@infradead.org, wenhu.wang@vivo.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,
Mainly two aspects:
 - Different message drivers modularly added to support different platforms.
   Currently, RPMON_QMI is available, and further maybe mailbox or so.
 - Different events to be notified and different actions to be taken out.
   Currently, connection check action is available, and remote endpoint's
   registeration event would be notified.

I hope the Remote Porcessor Monitor would eventually do something more
and be used by more users and platforms, and more actions and events
would be added as enhancement. At the same time, it is better to support
different SoC platforms. So I wrote the codes in kernel.

Thanks,
Wenhu

>> Changes since v1:
>>  - Addressed review comments from Randy
>> Changes since v2:
>>  - Added Cc list
>>  - Commit log typo fixing
>>  - Use the ARRAY_SIZE instead of calculations of multiple sizeof()
>>  - Use micros for qmi message tly_type fields
>> 
>> Wang Wenhu (3):
>>   driver: rpmon: new driver Remote Processor Monitor
>>   driver: rpmon: qmi message version 01
>>   driver: rpmon: add rpmon_qmi driver
>> 
>>  drivers/Kconfig                  |   2 +
>>  drivers/Makefile                 |   1 +
>>  drivers/rpmon/Kconfig            |  54 ++++
>>  drivers/rpmon/Makefile           |   3 +
>>  drivers/rpmon/rpmon.c            | 506 +++++++++++++++++++++++++++++++
>>  drivers/rpmon/rpmon_qmi.c        | 431 ++++++++++++++++++++++++++
>>  drivers/rpmon/rpmon_qmi.h        |  76 +++++
>>  drivers/rpmon/rpmon_qmi_msg_v1.c | 258 ++++++++++++++++
>>  include/linux/rpmon.h            |  68 +++++
>>  9 files changed, 1399 insertions(+)
>>  create mode 100644 drivers/rpmon/Kconfig
>>  create mode 100644 drivers/rpmon/Makefile
>>  create mode 100644 drivers/rpmon/rpmon.c
>>  create mode 100644 drivers/rpmon/rpmon_qmi.c
>>  create mode 100644 drivers/rpmon/rpmon_qmi.h
>>  create mode 100644 drivers/rpmon/rpmon_qmi_msg_v1.c
>>  create mode 100644 include/linux/rpmon.h
>> 
>> -- 
>> 2.17.1
>> 
