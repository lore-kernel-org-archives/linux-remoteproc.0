Return-Path: <robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171221013557.GE12655@minitux>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-2-git-send-email-clew@codeaurora.org> <20171220183000.rhxgyikfqzxmqkjo@rob-hp-laptop>
 <20171221013557.GE12655@minitux>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Dec 2017 16:39:58 -0600
Message-ID: <CAL_JsqJpGsnrp7Z1jqM=SEbVXDdtMMERPox7dYRLSEoG72NJ0g@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: Add label for GLINK bindings
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Chris Lew <clew@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Dec 20, 2017 at 7:35 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 20 Dec 10:30 PST 2017, Rob Herring wrote:
>
>> On Mon, Dec 18, 2017 at 02:02:09PM -0800, Chris Lew wrote:
>> > Add a label property to identify the edge this node represents.
>>
>> Why does a user need to know this?
>>
>
> We have multiple remoteproc instances, each one having one or more
> associated SMD or GLINK links (this node), exposing logical
> communication channels. Some of these logical channels are exposed to
> user space and we need a way to distinguish them there.

They should have some sort of discoverable property. There must be
some reason why you need a specific channel. I think of label as being
a sticker or silkscreen on a device which doesn't seem to be the case
here. This seems more like wanting fixed device numbering like disks
and I assume you know the position on fixed device numbers.

Rob
