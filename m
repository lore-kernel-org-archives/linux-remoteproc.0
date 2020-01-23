Return-Path: <robh@kernel.org>
MIME-Version: 1.0
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-2-bjorn.andersson@linaro.org> <20200104213804.GA30385@bogus>
 <20200104221752.GW549437@yoga>
In-Reply-To: <20200104221752.GW549437@yoga>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Jan 2020 16:07:38 -0600
Message-ID: <CAL_JsqJEq-eX-LoRiHHot8De4RbRS4-Np+hisTk4TWpehqsRwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info binding
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat, Jan 4, 2020 at 3:17 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 04 Jan 13:38 PST 2020, Rob Herring wrote:
>
> > On Thu, Dec 26, 2019 at 09:32:08PM -0800, Bjorn Andersson wrote:
> > > Add a devicetree binding for the Qualcomm periperal image loader
> > > relocation info region found in the IMEM.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >
> > > Changes since v1:
> > > - New patch
> > >
> > >  .../bindings/remoteproc/qcom,pil-info.yaml    | 35 +++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> > > new file mode 100644
> > > index 000000000000..715945c683ed
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> > > @@ -0,0 +1,35 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Qualcomm peripheral image loader relocation info binding
> > > +
> > > +description:
> > > +  This document defines the binding for describing the Qualcomm peripheral
> > > +  image loader relocation memory region, in IMEM, which is used for post mortem
> > > +  debugging of remoteprocs.
> > > +
> > > +maintainers:
> > > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,pil-reloc-info
> > > +
> > > +  offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: Offset in the register map for the memory region
> >
> > Why not use 'reg' instead?
> >
>
> Because we have one prior example of subdevice of "imem", which is
> compatible "syscon-reboot-mode" and that binding uses "offset".

Not that I'm proposing this, but nothing should prevent both from coexisting.

Rob
