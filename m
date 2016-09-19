Return-Path: <emil.l.velikov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1473081421-16555-18-git-send-email-peter.griffin@linaro.org>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org> <1473081421-16555-18-git-send-email-peter.griffin@linaro.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 20 Sep 2016 00:18:48 +0100
Message-ID: <CACvgo52_g7anGBd9HTUyYsbp5QmQEk9LR3nNHgSTgjQ29G3ViA@mail.gmail.com>
Subject: Re: [PATCH v9 17/19] drm/virtio: kconfig: Fix recursive dependency issue.
Content-Type: text/plain; charset=UTF-8
To: Peter Griffin <peter.griffin@linaro.org>
Cc: LAKML <linux-arm-kernel@lists.infradead.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, ohad@wizery.com, bjorn.andersson@linaro.org, devicetree <devicetree@vger.kernel.org>, linux-remoteproc@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>, dmaengine@vger.kernel.org, lee.jones@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 5 September 2016 at 14:16, Peter Griffin <peter.griffin@linaro.org> wrote:
> ST_SLIM_REMOTEPROC must select REMOTEPROC, which exposes the following
> recursive dependency.
>
>From a humble skim through remoteproc, drm and a few other subsystems
I think the above is wrong. All the drivers (outside of remoteproc),
that I've seen, depend on the core component, they don't select it.

Furthermore most places explicitly hide the drivers from the menu if
the core component isn't enabled.

Is there something that requires such a different/unusual behaviour in
remoteproc ?

Regards,
Emil
