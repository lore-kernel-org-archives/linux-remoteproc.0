Return-Path: <robh@kernel.org>
MIME-Version: 1.0
References: <20190813130946.16448-1-govinds@codeaurora.org>
 <20190813130946.16448-2-govinds@codeaurora.org> <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
 <20190814064126.GV26807@tuxbook-pro>
In-Reply-To: <20190814064126.GV26807@tuxbook-pro>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Aug 2019 17:17:21 -0600
Message-ID: <CAL_JsqKaZJ1asHynSJg45nJf8Jtj7MmC_OsVtPjNzf8nat1jrg@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Govind Singh <govinds@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Aug 14, 2019 at 12:39 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 13 Aug 06:43 PDT 2019, Rob Herring wrote:
>
> > On Tue, Aug 13, 2019 at 7:10 AM Govind Singh <govinds@codeaurora.org> wrote:
> > >
> > > Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
> >
> > You need to test this with 'make dt_binding_check' and fix the errors.
> >
> > >
> > > Signed-off-by: Govind Singh <govinds@codeaurora.org>
> > > ---
> > >  .../bindings/clock/qcom,q6sstopcc.yaml        | 45 +++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > > new file mode 100644
> > > index 000000000000..861e9ba97ca3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > > @@ -0,0 +1,45 @@
> > > +# SPDX-License-Identifier: BSD-2-Clause
> >
> > GPL-2.0-only OR BSD-2-Clause
> >
>
> Is this a requirement of the devicetree project?

More like my preference.

> Wouldn't the BSD
> license alone be sufficient for the type of interoperability that we're
> striving for?

Yes. However, folks like to copy and paste and forget to pay attention
to the license. So we'll end up with GPL licensed code copied into BSD
licensed code. Dual license doesn't completely solve that, but helps
somewhat IMO.

Rob
