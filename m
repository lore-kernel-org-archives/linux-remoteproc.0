Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 1/5] remoteproc: Fix unbalanced boot with sysfs for no
 auto-boot rprocs
References: <20180915003725.17549-1-s-anna@ti.com>
 <20180915003725.17549-2-s-anna@ti.com> <20181006061341.GC12063@builder>
From: Suman Anna <s-anna@ti.com>
Message-ID: <28c0d25e-62eb-0d6c-c479-52eb7fc6f095@ti.com>
Date: Mon, 8 Oct 2018 11:42:42 -0500
MIME-Version: 1.0
In-Reply-To: <20181006061341.GC12063@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/06/2018 01:13 AM, Bjorn Andersson wrote:
> On Fri 14 Sep 17:37 PDT 2018, Suman Anna wrote:
> 
>> The remoteproc core performs automatic boot and shutdown of a
>> remote processor during rproc_add() and rproc_del() for remote
>> processors supporting 'auto-boot'. The remoteproc devices not using
>> 'auto-boot' require either a remoteproc client driver or a
>> userspace client to use the sysfs 'state' variable to perform the
>> boot and shutdown. The in-kernel client drivers hold the
>> corresponding remoteproc driver module's reference count when they
>> acquire a rproc handle through the rproc_get_by_phandle() API, but
>> there is no such support for userspace applications performing the
>> boot through sysfs interface.
>> 
>> The shutdown of a remoteproc upon removing a remoteproc platform 
>> driver is automatic only with 'auto-boot' and this can cause a 
>> remoteproc with no auto-boot to stay powered on and never freed up
>> if booted using the sysfs interface without a matching stop, and
>> when the remoteproc driver module is removed or unbound from the
>> device. This will result in a memory leak as well as the 
>> corresponding remoteproc ida being never deallocated. Fix this by
>> holding a module reference count for the remoteproc's driver during
>> a sysfs 'start' and releasing it during the sysfs 'stop' 
>> operation.
>> 
> 
> This prevents you from rmmod'ing the remoteproc driver, but it does
> not prevent you from issuing an unbind of the driver - resulting in
> the same issue.

Well, the unbind is always a problem as it ignores the module usecounts,
and that's a generic issue. I have used suppress_bind_attrs in the
relevant remoteproc drivers downstream (need to actually add that for
wkup_m3) when they are being booted by other clients, otherwise more
often than not the client drivers create a kernel crash.

> 
> I would prefer if we made sure that rproc_del() always cleaned up
> any resources (and stopped the remoteproc processor), but I'm
> uncertain of how to deal with remote processors that are supposed to
> survive Linux shutting down.

This creates unbalanced paths and we definitely do not want stop a
processor from underneath the client drivers that have booted them.
Hence this patch which creates parity with auto-booted processors and
still requested by some other clients.

regards
Suman

> 
> But I'm also uncertain how we can make the remoteproc core ensure
> that no dynamic resources are leaked in such scenario.
> 
> Regards, Bjorn
> 
>> Signed-off-by: Suman Anna <s-anna@ti.com> --- 
>> drivers/remoteproc/remoteproc_sysfs.c | 16 +++++++++++++++- 1 file
>> changed, 15 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
>> b/drivers/remoteproc/remoteproc_sysfs.c index
>> 47be411400e5..2142b3ea726e 100644 ---
>> a/drivers/remoteproc/remoteproc_sysfs.c +++
>> b/drivers/remoteproc/remoteproc_sysfs.c @@ -11,6 +11,7 @@ * GNU
>> General Public License for more details. */
>> 
>> +#include <linux/module.h> #include <linux/remoteproc.h>
>> 
>> #include "remoteproc_internal.h" @@ -100,14 +101,27 @@ static
>> ssize_t state_store(struct device *dev, if (rproc->state ==
>> RPROC_RUNNING) return -EBUSY;
>> 
>> +		/* +		 * prevent underlying implementation from being removed +
>> * when remoteproc does not support auto-boot +		 */ +		if
>> (!rproc->auto_boot && +
>> !try_module_get(dev->parent->driver->owner)) +			return -EINVAL; + 
>> ret = rproc_boot(rproc); -		if (ret) +		if (ret) { 
>> dev_err(&rproc->dev, "Boot failed: %d\n", ret); +			if
>> (!rproc->auto_boot) +				module_put(dev->parent->driver->owner); +
>> } } else if (sysfs_streq(buf, "stop")) { if (rproc->state !=
>> RPROC_RUNNING) return -EINVAL;
>> 
>> rproc_shutdown(rproc); +		if (!rproc->auto_boot) +
>> module_put(dev->parent->driver->owner); } else { 
>> dev_err(&rproc->dev, "Unrecognised option: %s\n", buf); ret =
>> -EINVAL; -- 2.18.0
>> 
