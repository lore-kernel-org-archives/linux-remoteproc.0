Date: Tue, 13 Aug 2019 23:41:30 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
Message-ID: <20190814064126.GV26807@tuxbook-pro>
References: <20190813130946.16448-1-govinds@codeaurora.org>
 <20190813130946.16448-2-govinds@codeaurora.org>
 <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Govind Singh <govinds@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 13 Aug 06:43 PDT 2019, Rob Herring wrote:

> On Tue, Aug 13, 2019 at 7:10 AM Govind Singh <govinds@codeaurora.org> wrote:
> >
> > Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
> 
> You need to test this with 'make dt_binding_check' and fix the errors.
> 
> >
> > Signed-off-by: Govind Singh <govinds@codeaurora.org>
> > ---
> >  .../bindings/clock/qcom,q6sstopcc.yaml        | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > new file mode 100644
> > index 000000000000..861e9ba97ca3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: BSD-2-Clause
> 
> GPL-2.0-only OR BSD-2-Clause
> 

Is this a requirement of the devicetree project? Wouldn't the BSD
license alone be sufficient for the type of interoperability that we're
striving for?

Regards,
Bjorn
