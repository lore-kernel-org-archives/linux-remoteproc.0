Return-Path: <linux-arm-msm-owner@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 11 Oct 2019 19:05:08 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH_v3 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
In-Reply-To: <20190906203131.936A22070C@mail.kernel.org>
References: <20190823131401.4011-1-govinds@codeaurora.org>
 <20190823131401.4011-2-govinds@codeaurora.org>
 <CAL_JsqLpVDJBh5qZwudncB8sggb85f3efqs1z9EA+zbVPWX++g@mail.gmail.com>
 <20190906203131.936A22070C@mail.kernel.org>
Message-ID: <0bf4caf58a0663fea75f12838249c572@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 2019-09-07 02:01, Stephen Boyd wrote:
> Quoting Rob Herring (2019-08-27 05:27:19)
>> On Fri, Aug 23, 2019 at 8:14 AM Govind Singh <govinds@codeaurora.org> 
>> wrote:
>> >
>> > Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
>> >
>> > Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> > ---
>> >  .../bindings/clock/qcom,q6sstopcc.yaml        | 47 +++++++++++++++++++
>> >  1 file changed, 47 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> > new file mode 100644
>> > index 000000000000..39621e2e2f4e
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> > @@ -0,0 +1,47 @@
>> > +# SPDX-License-Identifier: BSD-2-Clause
>> 
>> Dual license please.
>> 
> 
> Yes, please fix the binding.

fixed in v4.

Thanks,
Govind
