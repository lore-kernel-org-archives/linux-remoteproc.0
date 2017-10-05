Return-Path: <anup@brainfault.org>
MIME-Version: 1.0
In-Reply-To: <20171005024427.GU1165@minitux>
References: <1506917900-12289-1-git-send-email-anup@brainfault.org> <20171005024427.GU1165@minitux>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Oct 2017 09:30:42 +0530
Message-ID: <CAAhSdy3Dk88F-MnzCS5Ftz0o6tmVW2utELgeSB0=pQiJwVikjA@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: Allow RPMSG_VIRTIO to be enabled via menuconfig
 or defconfig
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Oct 5, 2017 at 8:14 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Sun 01 Oct 21:18 PDT 2017, Anup Patel wrote:
>
>> Currently, RPMSG_VIRTIO can only be enabled if some other kconfig
>> option selects it. This does not allow it to be enabled for
>> virtualized systems where Virtio RPMSG is available over Virtio
>> MMIO or PCI transport.
>>
>> This patch updates RPMSG_VIRTIO kconfig option so that we can
>> enable the VirtIO RPMSG driver via menuconfig or defconfig.
>>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> ---
>
> This part looks good (and really I think this is the right thing to do).
> But turning RPMSG_VIRTIO into a user selectable item makes it invalid to
> "select RPMSG_VIRTIO" from drivers/remoteproc/Kconfig.
>
> Can you please as part of this change remove those selects and as a
> separate patch add CONFIG_RPMSG_VIRTIO=m to
> arch/arm/configs/multi_v7_defconfig?

Sure, I will update the patch as-per your suggestion and also
send separate patch to add CONFIG_RPMSG_VIRTIO=m in
arch/arm/configs/multi_v7_defconfig.

Regards,
Anup
