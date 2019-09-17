Return-Path: <gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Sep 2019 12:37:55 +0530
From: gokulsri@codeaurora.org
Subject: Re: [PATCH V2 10/12] dt-bindings: firmware: qcom: Add compatible for
 IPQ8074 SoC
In-Reply-To: <5d7c0ecb.1c69fb81.74810.a358@mx.google.com>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
 <1568375771-22933-11-git-send-email-gokulsri@codeaurora.org>
 <5d7c0ecb.1c69fb81.74810.a358@mx.google.com>
Message-ID: <1472f76e742d576fa5d6c6cad7b40605@codeaurora.org>
To: Rob Herring <robh@kernel.org>
Cc: sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org, nprakash@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,

On 2019-09-14 03:18, Rob Herring wrote:
> On Fri, 13 Sep 2019 17:26:09 +0530, Gokul Sriram Palanisamy wrote:
>> Add compatible for IPQ8074 support.
>> This does not need clocks for scm calls.
>> 
>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>>  1 file changed, 1 insertion(+)
>> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. 
> However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

  Sorry, missed it. Will add it.

Regards,
  Gokul
