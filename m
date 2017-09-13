Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH v3 5/6] remoteproc: qcom: Add support for q6v5-wcss pil
References: <1504154734-12175-1-git-send-email-sricharan@codeaurora.org>
 <1504154734-12175-6-git-send-email-sricharan@codeaurora.org>
 <20170912142137.nzx2s7xcyde5d2js@rob-hp-laptop>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <f0c049c8-a891-ebb1-d90d-7d94befb513b@codeaurora.org>
Date: Wed, 13 Sep 2017 15:03:50 +0530
MIME-Version: 1.0
In-Reply-To: <20170912142137.nzx2s7xcyde5d2js@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,

On 9/12/2017 7:51 PM, Rob Herring wrote:
> On Thu, Aug 31, 2017 at 10:15:33AM +0530, Sricharan R wrote:
>> IPQ8074 has an integrated Hexagon dsp core q6v5 and a wireless lan
>> (Lithium) IP. An mdt type single image format is used for the
>> firmware. So the mdt_load function can be directly used to load
>> the firmware. Also add the relevant resets required for this core.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  7 ++-
> 
> Acked-by: Rob Herring <robh@kernel.org>

  Thanks !!

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
