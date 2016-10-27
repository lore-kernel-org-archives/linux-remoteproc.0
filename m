Return-Path: <Matt.Redfearn@imgtec.com>
Subject: Re: [PATCH v3 0/2] remoteproc: Add sysfs interface
References: <1476878748-32097-1-git-send-email-matt.redfearn@imgtec.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <9607ab24-e9f3-515b-b143-e2c7ca19c0eb@imgtec.com>
Date: Thu, 27 Oct 2016 15:10:15 +0100
MIME-Version: 1.0
In-Reply-To: <1476878748-32097-1-git-send-email-matt.redfearn@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 19/10/16 13:05, Matt Redfearn wrote:
> It is often desireable to boot a remote processor with different
> firmware files, depending on the needs of the system at a particular
> time. This series adds a sysfs interface to the remoteproc core,
> exposing interfaces to manipulate the remote processor. One interface is
> the "state" file which performs the same function as the one in debugfs
> (which is removed later in the series). The other is a "firmware" file
> which allows retrieval of the name of the running firmware, and allows a
> new firmware to be loaded when written, as long as the remote processor
> is currently stopped.
>
> Some groundwork must be laid first, changing the storage mechanism of
> the firmware name such that it can be rewritten easily, then that is
> wired up to the new sysfs interface.
>
> This series is based on v4.9-rc1
>
>
> Changes in v3:
> Drop call to rproc_add_virtio_devices from sysfs firmware_store
> Use strcspn to find firmware name length
> Explicit indexes for state strings
>
> Changes in v2:
> Have firmware_store perform the necessary steps inline.
> Use sysfs_streq when dealing with writes to sysfs files
>
> Matt Redfearn (2):
>    remoteproc: Add a sysfs interface for firmware and state
>    remoteproc: debugfs: Remove state entry which is duplicated is sysfs
>
>   Documentation/ABI/testing/sysfs-class-remoteproc |  50 ++++++++
>   drivers/remoteproc/Makefile                      |   1 +
>   drivers/remoteproc/remoteproc_core.c             |   3 +
>   drivers/remoteproc/remoteproc_debugfs.c          |  71 -----------
>   drivers/remoteproc/remoteproc_internal.h         |   5 +
>   drivers/remoteproc/remoteproc_sysfs.c            | 151 +++++++++++++++++++++++
>   6 files changed, 210 insertions(+), 71 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-remoteproc
>   create mode 100644 drivers/remoteproc/remoteproc_sysfs.c
>

Hi Bjorn,

Is this version of the patchset ok? Any feedback welcome :-)

Thanks,
Matt
