Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v2 1/4] remoteproc: Introduce auto-boot flag
References: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
Message-ID: <ba437b4f-dde3-8def-afe2-472430b750e6@ti.com>
Date: Wed, 31 Aug 2016 13:27:51 -0500
MIME-Version: 1.0
In-Reply-To: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 08/11/2016 04:52 PM, Bjorn Andersson wrote:
> Introduce an "auto-boot" flag on rprocs to make it possible to flag
> remote processors without vdevs to automatically boot once the firmware
> is found.
> 
> Preserve previous behavior of the wkup_m3 processor being explicitly
> booted by a consumer.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Loic Pallardy <loic.pallardy@st.com>
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - s/always_on/auto_boot/
> - Fixed double increment of "power" in recover path
> - Marked wkup_m3 to not auto_boot
> 

I am seeing various issues with this series as I am testing this series
more thoroughly with various TI remoteproc drivers and IPC stacks based
on virtio devices. I use very simple firmware images that publishes the
rpmsg-client-sample devices, so that I can use the kernel
rpmsg_client_sample to test the communication.

Here's a summary of the main issues:

1. The rproc_boot holds a module reference count to the remoteproc
platform driver so that it cannot be removed when a remote processor is
booted. The previous architecture allowed virtio_rpmsg_bus or the
platform remoteproc driver to be installed independent of each other
with the boot actually getting triggered when the virtio_rpmsg_bus gets
probed in find_vqs. The boot now happens when just the platform
remoteproc driver is installed independent of virtio_rpmsg_bus and
results in holding self-reference counts. This makes it impossible to
remove the remoteproc platform module cleanly (we shouldn't be imposing
force remove), which means we can't stop the remoteprocs properly.

2. The reversal of boot between virtio_rpmsg_bus and remoteproc core
also meant that the virtio devices and therefore the memory for vrings
are allocated at the time virtio_rpmsg_bus is probed in find_vqs(). The
remoteproc can be booted without the virtio_rpmsg_bus module installed.
We do use the allocated dma addresses of the vrings in the published
resource table, but now the remote processor is up even before these
values are filled in. I had to actually move up the rproc_alloc_vring
alongside rproc_parse_vring to have the communication up.

3. The remoteproc platform driver cannot be removed previously when the
corresponding virtio devices are probed/configured properly and all the
communication flow w.r.t rpmsg channel publishing followed from the
remoteproc boot. These channels are child devices of the parent virtio
devices, and since the remoteproc boot/shutdown followed the virtio
device probe/removal lifecycle, the rpmsg channels life-cycle followed
that of the parent virtio device. My communication paths are now failing
if I remove the virtio_rpmsg_bus and insmod it again as the vrings and
vring buffers are configured again while the remoteproc is still
running. Also, since the remoteproc is not rebooted, the previously
published rpmsg channels are stale and they won't get recreated.

In summary, the current patches worked nicely in a error recovery
scenario but are not working properly with the various combinations of
module insertion/removal process.

regards
Suman
