Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v2 1/3] remoteproc: qcom: Encapsulate pvt data structure
 for q6v56 hexagon.
References: <1478268057-11847-1-git-send-email-akdwived@codeaurora.org>
 <1478268057-11847-2-git-send-email-akdwived@codeaurora.org>
 <20161110203013.fphvzd4df3zvjdfi@rob-hp-laptop>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Message-ID: <a29bce91-1300-0728-51dd-7d009d9e056b@codeaurora.org>
Date: Wed, 16 Nov 2016 19:32:44 +0530
MIME-Version: 1.0
In-Reply-To: <20161110203013.fphvzd4df3zvjdfi@rob-hp-laptop>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: bjorn.andersson@linaro.org, Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/11/2016 2:00 AM, Rob Herring wrote:
> On Fri, Nov 04, 2016 at 07:30:54PM +0530, Avaneesh Kumar Dwivedi wrote:
>> Encapsulate resources specific to each version of hexagon chip to
>> device node to avoid conditional check for manipulation of those
>> resources in driver code.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
>>   drivers/remoteproc/qcom_q6v5_pil.c                 | 137 ++++++++++++++++++---
>>   2 files changed, 120 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 57cb49e..cbc165c 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -8,6 +8,7 @@ on the Qualcomm Hexagon core.
>>   	Value type: <string>
>>   	Definition: must be one of:
>>   		    "qcom,q6v5-pil"
>> +		"qcom,q6v56-pil"
> Perhaps some explanation in the commit message about what these magic
> numbers mean?

     "v56" represent class of hexagon chip, which again is 
differentiated based on version number. Two
     different MSM SOC may use same class of hexagon chip. example is as 
below.

     msm8974  q6v5 version  5.0.0
     msm8916  q6v5 version  5.1.1
>
> Rob
