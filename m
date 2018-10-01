Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 0/5] remoteproc sysfs fixes/improvements
References: <20180915003725.17549-1-s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <63b8b9a3-d938-cb7a-9a77-12159d4f38a7@ti.com>
Date: Mon, 1 Oct 2018 16:11:29 -0500
MIME-Version: 1.0
In-Reply-To: <20180915003725.17549-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 09/14/2018 07:37 PM, Suman Anna wrote:
> Hi Bjorn,
> 
> The following series includes couple of fixes and improvements
> associated with the sysfs interfaces. Patches are based on top
> of 4.19-rc1. The first 3 patches are independent of each other.
> 
> Following is the patch summary:
>  - Patch 1 fixes an issue with unbalanced sysfs start/stop
>    and module removal
>  - Patch 2 adds a minor additional check on firmware name
>    being echoed into the sysfs file
>  - Patch 3 is a minor kerneldoc fix.
>  - Patches 4 and 5 introduce a new request denial to sysfs
>    interfaces to not allow userspace to meddle with a remoteproc
>    client driven boot flow, and usage of it by Wkup M3 remoteproc
>    driver

Can you pick up this series for 4.20 please if you don't have any comments?

regards
Suman

> 
> regards
> Suman
> 
> Suman Anna (5):
>   remoteproc: Fix unbalanced boot with sysfs for no auto-boot rprocs
>   remoteproc: Check for NULL firmwares in sysfs interface
>   remoteproc: Add missing kernel-doc comment for auto-boot
>   remoteproc: Introduce deny_sysfs_ops flag
>   remoteproc/wkup_m3: Set deny_sysfs_ops flag
> 
>  drivers/remoteproc/remoteproc_sysfs.c | 29 ++++++++++++++++++++++++++-
>  drivers/remoteproc/wkup_m3_rproc.c    |  1 +
>  include/linux/remoteproc.h            |  3 +++
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
