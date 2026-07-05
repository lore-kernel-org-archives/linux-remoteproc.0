Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2065536E494
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783240928; cv=none; b=QLtZDqIE6CCkRv9ml5efQ/Gv4VgDoV0PBqDFHAYC7Kk+6m7swpPWMTAwH8LQJHiUyXXZLV5uNeszHm1NY9lrTrp1zlDrdEfEw9FrIbcFYsJiOWl55o+bfT9FG0o4uX2G60eES2ViXEehybzTEv0Ivq3qh+JmIyNgNxalRUycnzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783240928; c=relaxed/simple;
	bh=yKKzPWK+/FdU/VXFVrVaqR48TggYD3+aJAhMO7AVZgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAkeC1NoCcZ2XdjAulo3YT9Xo7pVeUpD8/zOA/wII5DEndzy1x6/WQtQDwYsXwAzgoO8kgkwhhD3EQJOwIe/MINAZw52ASycqgdFOe97y0cgsA4eJ+3yzizo5OF6gVJC5ZPT10WnsxlldSKyZqlzxeLJEewjFLjiwPC0K8f/1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzdQnron; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIzXATG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzdQnron";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HIzXATG0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651I5tG336197
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 08:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdRFpiIhdtARWUSRwfBjeoXMFG+E8udRGzwOjsDHjWE=; b=BzdQnronpobP/+PA
	rGJLRm8/7KNZWXdLhsyatKyJxOoP+UY+lMquekjgVL5zF+S2PJnI+zsZjZn/GMNK
	lWUnJTYSIdUrm3ynSa3H8b+kipiEb4iiDB/XGpNV4iqRwE5k+VLs6MrfK7vOFs7C
	iFRszOuISJZRGk0OFpc9I1v8c/HymomUA07PKGfjGrDTS6ZnAiBuDnDOlx1NF9Fi
	Xo7lUgAtrB08D49SE8saY1WEBuT1asv40kO5yJNi5/6WGdK8UogvDtgWIQY7ePBB
	MnA8sLXibyGsTJ3ygDu89NdxxkkbcveFDqoSRb45U0MzYv/FBQRUevvav2jwAAnw
	a000UQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh2f0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 08:42:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384636ba25dso1079733a91.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783240924; x=1783845724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdRFpiIhdtARWUSRwfBjeoXMFG+E8udRGzwOjsDHjWE=;
        b=HIzXATG0tKDX0xGhSYs2pHyW3rmdvmxAAt+fC4LGjL7IabAlD4Y/4lXMyZAym5dCYl
         crDy1mMwuOXfc+MG+ICBXLK9tIYJ7az0hEhdlTeA+owDqC666cyckRf95BJxLfsWHPBy
         eupOEuKbxBqCrb3Jsso+BE0HsmvodBST3XSxoO0DZn0Ag5XMbCp8mD1Z+ngroXsTYMAc
         DyOlHBs8lQYnYvzY04NSoW3qzGcnQMv/R3BmYYKUS390c1hV3Q3ftaIpnpSxt7egmclk
         zyF9vG012fujPCTHSqn5AZG3diUNUVDSjgj/gZRtWj5WV8On3IV0qrvUCwMM+nX54EAh
         KSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240924; x=1783845724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdRFpiIhdtARWUSRwfBjeoXMFG+E8udRGzwOjsDHjWE=;
        b=U/QztGr2SI9wWI40m0Ro1xLNbeEYUmQ8FjRefhhbXuHOd69R7W1YS/mQ2vnxiNHn8T
         nJiCbJVrAyU8YVROWyMHhis7B+jY60SUFna23PyUMrjvl4FfGbw9UYi7ySSWUYQXwiVt
         ivHB/vIIhV4u62Z11mhaKSAEEc+WJ1rpKy1xJBPE9ULTZOAF+4Kwzp0CLKJHVv3yYarb
         XG7pV3kbM8PEx8Kx8rq25lkbJSbqOpjQIPVlTXGzT1Sss9wxGsVb0HIg6NDPjRubSeZ+
         BltKhSXIY4vH2KK9YLEY7wi2UBcAisLxD8dm9/xT0Vq4RNgo2zfCO/qq2UUY37xtivmg
         X2Yw==
X-Forwarded-Encrypted: i=1; AHgh+RrRbQVLpv/x2dw3WXLI80UeybXQZ90gqxm/lIKnKLtZhw+L/vNiKKPwHSoKngFHseoURt+eonze6Lw1XDsXfJXG@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZPscDcpWypgqxIZOQNZv+TwJteeFbBFWRkj30JuBTRkyy1Dt
	bRPwhAg5q0RkfnjlnHP+F2R8pvbk8gfUSeXk3zSI8+kR4xlksJdoKif9SN0aIj484J8ksTu1NuJ
	MDwgX1wsdmxvNht0yaiBvF9Gp4JskCxpZ14exapdSqge8XeJ0ymEW4t2KzbYeQQCzl8c6TX9o
X-Gm-Gg: AfdE7ck7K5Ms1jLz1pNFPsoWZw0x/VMFVlHjZKa/WSs+jITgzGURrbo5rk45LDssGkx
	PdiP7OzEuE5ZyDABQ5PscxPtIR5tuUYcjXWFukF+Z+GTXogvRGBrk37mIk/oo32vEjdhyBAIsP2
	x7+EEiSohweYkjmP7PxlyTHqCX04EV5a/KdJ/gFav2RZCPqsf5MXUHCTmD7HoTcgaUrNRfsI694
	Or1E3nFR+cf6YeaDzJLnomjQgKLOW2kg3xYmKjNI63LZQVLQLEDn3960RC4ep1/u8hAYLR1UTMm
	6IWxpP1reDCQww4N6unqOC24CvSTeoXR9vOrXIOShvOlyDnu11YLp5kydqeAZFf7caXyMKPFx/L
	PZvZc7LYAKxpm9ZVSUz3q/kfl006/IYHlHEWn4dtu3w==
X-Received: by 2002:a17:90a:dfc8:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-3829f9dffe0mr5138253a91.30.1783240924026;
        Sun, 05 Jul 2026 01:42:04 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc8:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-3829f9dffe0mr5138234a91.30.1783240923435;
        Sun, 05 Jul 2026 01:42:03 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7bb8fasm38382008eec.1.2026.07.05.01.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 01:42:02 -0700 (PDT)
Message-ID: <9821302b-5e14-4a8e-8b1c-f3eb1824d7a3@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 14:11:54 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-2-3882189c1f83@oss.qualcomm.com>
 <20260703-quirky-impartial-oyster-caab0d@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260703-quirky-impartial-oyster-caab0d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4a18dd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=V7JA6PPGWL3xxjczixMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4OCBTYWx0ZWRfXxUYMdZt48yBz
 KHHxRKynAaDbgK6wYAdTu5a5nG7s6UhxlH9QblFkmogtOE/mtOdJZqNUOBoldUP5N5Ru5oR4whD
 eXyxGj/KjmxTaINUsX3V8kt485G9oD1njQ8FjNp/CVb8kNFIhTQYhwO2zKjiAVxR3kzTtVa3XRc
 WaFzaBapa4wILsZjKF2xZmIZ/In8tTtA4hmQABvXkgfG6IcC81lEMPUqY1RS0cIZcVBa4nDeXDW
 vLXYVDEO8wh29t1TNmJ0hGqhsAa9UlabU1xhbr32SF1M7RlPTkY93Tik/UJYZGrhVx6XNJTbZUu
 qQQqsgfDcJiwaefH7FxwRhJpTm3+s3OPTwv6kdMXN982keIqbVVnMhHrM6/b96ylKSicQv/GK0t
 icTsWXvdALh4+zqxlsW81XlOP4bH92x3dhthG9KS+nAEfx387rUfOMtmCoj4T1Cm+dVPr0nf6vS
 uc0yOzowjpTa3zSRz2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4OCBTYWx0ZWRfX+vZjb18kE6a1
 zpAtbWLpWeA+y8ZRlEHd9Mo7HeTPC6wzh4v7VIedoVr3rHLRZ9b0nTz5epx5J1XrMNC3zVFNKrR
 Bq5ps6qbQfq6CuL+6LWeYx9RfsNNq2k=
X-Proofpoint-ORIG-GUID: YXwH79WX5nhnHLYpkrPxBwwXCl68mdPV
X-Proofpoint-GUID: YXwH79WX5nhnHLYpkrPxBwwXCl68mdPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050088



On 7/3/2026 1:19 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:33:05AM +0530, Gaurav Kohli wrote:
>> Document the optional #cooling-cells property for Qualcomm PAS
>> remoteproc nodes so they can be used as thermal cooling devices via
>> the QMI Thermal Mitigation Device (TMD) interface.
>>
>> Qualcomm remote processors expose TMD endpoints that support thermal
>> throttling through firmware. The cooling-device specifier uses 3 cells:
>>
>>    <&phandle device_id min_state max_state>
>>
>> where device_index selects the TMD endpoint (for example PA, modem,
>> or CDSP software mitigation), with constants defined in:
>> - dt-bindings/firmware/qcom,qmi-tmd.h
> 
> Full path.
> 
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../bindings/remoteproc/qcom,pas-common.yaml       | 39 ++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 4607b459131b..ef11371058c4 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -79,6 +79,14 @@ properties:
>>         channels and devices related to the ADSP.
>>       unevaluatedProperties: false
>>   
>> +  '#cooling-cells':
>> +    description: |
>> +      Cooling device with three cells:
>> +        Cell 0: Cooling device id
> 
> And here you provide full path with device IDs.

thanks for review, will update this.

> 
>> +        Cell 1: Minimum cooling state
>> +        Cell 2: Maximum cooling state
>> +    const: 3
>> +
>>     glink-edge:
>>       $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>       description:
>> @@ -95,3 +103,34 @@ required:
>>     - qcom,smem-state-names
>>   
>>   additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/thermal/thermal.h>
>> +    #include <dt-bindings/firmware/qcom,qmi-tmd.h>
>> +
>> +    remoteproc: remoteproc {
>> +      #cooling-cells = <3>;
>> +    };
> 
> Drop, empty node.
> 

Ack, will remove this.

>> +
>> +    thermal-zones {
>> +      subsystem-thermal {
>> +        thermal-sensors = <&tsens 0>;
>> +
>> +        trips {
>> +          alert: alert {
>> +            temperature = <95000>;
>> +            hysteresis = <2000>;
>> +            type = "passive";
>> +          };
>> +        };
>> +
>> +        cooling-maps {
>> +          map0 {
>> +            trip = <&alert>;
>> +            cooling-device = <&remoteproc QCOM_CDSP_TMD_CDSP_SW
>> +                             THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +          };
>> +        };
>> +      };
>> +    };
> 
> thermal-zones are not relevant to remoteproc.
> 

Ack, wanted to show by example, can i use commit message for that.

> Entire example feels pointless - how is schema even applied/matched
> against it?
> 
> Best regards,
> Krzysztof
> 

