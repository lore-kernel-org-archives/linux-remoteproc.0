Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH v4 5/6] remoteproc: qcom: Add support for q6v5-wcss pil
References: <1510238775-14883-1-git-send-email-sricharan@codeaurora.org>
 <1510238775-14883-6-git-send-email-sricharan@codeaurora.org>
 <20171110210808.6sms52m4rrgqnf2r@rob-hp-laptop>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <ee5d49fb-f60c-1840-5bd1-80f41e8dcc16@codeaurora.org>
Date: Tue, 14 Nov 2017 15:21:09 +0530
MIME-Version: 1.0
In-Reply-To: <20171110210808.6sms52m4rrgqnf2r@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,

On 11/11/2017 2:38 AM, Rob Herring wrote:
> On Thu, Nov 09, 2017 at 08:16:14PM +0530, Sricharan R wrote:
>> IPQ8074 has an integrated Hexagon dsp core q6v5 and a wireless lan
>> (Lithium) IP. An mdt type single image format is used for the
>> firmware. So the mdt_load function can be directly used to load
>> the firmware. Also add the relevant resets required for this core.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  7 ++-
> 
> Please add acks when posting new versions.

oops.Really sorry, missed it. will update.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
