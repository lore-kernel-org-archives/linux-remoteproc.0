Return-Path: <robh@kernel.org>
MIME-Version: 1.0
References: <20200211142614.13567-1-paul@crapouillou.net> <20200212020707.GA29808@bogus>
In-Reply-To: <20200212020707.GA29808@bogus>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Feb 2020 20:08:30 -0600
Message-ID: <CAL_Jsq+3fWUaMhbrJ5m2sDLC8wK-L0PysCyCe7Eje0VzPTcqvA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: Document JZ47xx VPU auxiliary processor
Content-Type: text/plain; charset="UTF-8"
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, od@zcrc.me, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Feb 11, 2020 at 8:07 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 11 Feb 2020 11:26:09 -0300, Paul Cercueil wrote:
> > Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from
> > Ingenic is a second Xburst MIPS CPU very similar to the main core.
> > This document describes the devicetree bindings for this auxiliary
> > processor.
> >
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> >
> > Notes:
> >     v2: Update TCSM0 address in example
> >     v3: Change node name to 'video-decoder'
> >     v4: Convert to YAML. I didn't add Rob's Ack on v3 because of that (sorry Rob)
> >     v5: - Fix 'reg' not in <addr, len> pairs
> >         - Add missing include to devicetree example
> >
> >  .../bindings/remoteproc/ingenic,vpu.yaml      | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
> >
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

Disregard this, you did say why.
