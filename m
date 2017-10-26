Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 25 Oct 2017 21:51:44 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] rpmsg: Allow RPMSG_VIRTIO to be enabled via
 menuconfig or defconfig
Message-ID: <20171026045144.GA12511@builder>
References: <1507221800-25519-1-git-send-email-anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507221800-25519-1-git-send-email-anup@brainfault.org>
To: Anup Patel <anup@brainfault.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 05 Oct 09:43 PDT 2017, Anup Patel wrote:

> Currently, RPMSG_VIRTIO can only be enabled if some other kconfig
> option selects it. This does not allow it to be enabled for
> virtualized systems where Virtio RPMSG is available over Virtio
> MMIO or PCI transport.
> 
> This patch updates RPMSG_VIRTIO kconfig option so that we can
> enable the VirtIO RPMSG driver via menuconfig or defconfig. The
> patch also removes "select RPMSG_VIRTIO" from various remoteproc
> kconfig options because it is now user selectable.
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>

Sorry for not picking this up earlier. Applied to rpmsg-next.

Regards,
Bjorn
