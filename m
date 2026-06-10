Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B23F8EDE
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 12:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092960; cv=none; b=OtpyU0TBrXPv8gMllxPg3cxwEUsJSAmMDyrEixHY4WYv5ZemSLcXK5kDRu/zi1j6UPd/95q3PRBDyEOqu+cDqcPRPdP8wYKYBVXQLrwH2GPqtIYN85P4J1h8oYjRGDm5kOLzsQ17TZkHzB3VkVP+iAIg/KqeGdBW/c0lf418CXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092960; c=relaxed/simple;
	bh=6N+clulkPZ4b+YW1h7cMHtrZN8QWlpzXaaiZ3uRZxwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCOwCBCas6mgOWJaiB4Oz9KogtXXOwNElnEyFNIMP52Qnb8xTLsTC3jRbDVB/o6TXx5zPUwR+oJ9/SmjqU1Wd+wT6SuE5YSEW/H8vR1lqf3RtW7+GPa3mJN2fpvlsn2nmW2zq+Ut1Dg8EcJue7x2YsV/33MZVL3a2K6vsw5oOeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUWXN/28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8e3U612; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUWXN/28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8e3U612"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ABNGx51491127
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 12:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=; b=dUWXN/28H3Gtxug4
	ks41kiAke4JNBhKpMulTZDdrUnKYWHXkPzGTYn1fkasbP/PdAoYD5hX++Xc1kWwZ
	VMauhM3cYii9mZnp4PGhes7AfCoR8jGROnUt/GtpuDSsTm/eIMDDzLu5mtwrgVf3
	jPP+SCpIPoxKKLWeDucqIrr15Vn/9wVJo4VHekjxaYOMbZvJ+FSZc6dJPR9Dnhyv
	LlitetEZNfFG2feFczsldwHOu1lV/EHndPCsVzh8b+1oj6wIuqiMiD6EClifE7Xl
	SoSeMda94TdwCrgjgeuteZlc/LejPc07cqR9JY6GutmOO9K9zvOGCiAp5ivZlcqu
	em2RlA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2seh8ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 12:02:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso4502418b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781092957; x=1781697757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=;
        b=L8e3U612DLvib8hEIzZGEapMpB6gGJ5HquQ8Kbq8k/RN3rtzn6QZsDZkzypFEoN+nx
         V6eWPZ2IPabAlfcYGOF0CrROOUHOGPmmWr+RpzamamwV2r36DLuGT1/C/MP5H2E9XRgK
         SWuPW2vb7RBcxkF16lO/7FHaiUgGAsZRxXqU4XCUTQJfAgyGOPvavQyfM+uqmTf/Z4Hn
         sUw9LakynUpv7ad0BRgMB0cmw9bvhCFwari/OQJOiJ/bwFtvLI5syqloYodwnjmiBJFc
         y8dUC5RYu7vlt64ipCPvw3M38LfVXgJK3TzQ52bWuoQqC7EojOu04vfEM+fqiyrM7JZV
         jjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092957; x=1781697757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=;
        b=ICCFgtwe9G9NwxxvbL+ZwirIaAgJmz+cbiDAgEDNCH2lruibSZrjBeV2DxfkIeMx7n
         v6XfyJ4glnd/XCu4FPS6jhSwb5aygheG2K9Uj3YDGtg+LNJeR7XY9V2RO36WzlgBlusT
         8cB0ti9ZkXIjhCvRh9yWHPnEboDBrt5nu/Nk1grh8e/+GfaTo/XK2o2u+xvEEiMucLkp
         OMU4bojFbwV1T1lIol+q1qZkmFq2kq78ufUz4T/dHAPuJixLeEVpGjkC1T/WHMqO9Mx/
         0ap+ttjKVU0Ap9y08ve2bNeWciRkVwhdbkLn6oMtNit9/8ze2U5zmvWoUoHKnddzWKUL
         x37A==
X-Forwarded-Encrypted: i=1; AFNElJ/DFOs3PlAk2JpkehFSK7/pfQFww+YTKrWhPvhJn37S09Ijui5+0B3GpMDYCsFRGx4hvNTU/gaNT+RtDA4HNKpC@vger.kernel.org
X-Gm-Message-State: AOJu0YztqPoSvkPKRK0A8wSvzUTZ7aBUWRu2wb9Jl1Js/4F7UcMTK4X/
	lUPMaA0gqOQoSVOQ/XWc0cvGtfWbqC5AsbN3k37Wv3BrRdD8c318wE7YexrO4UZHsheGSPq4sMt
	gzXGmgf4F7TyRwnoN1PW5QFxgwJDj6c4uKSZSVwolQ0GVdD4dDK2g4CFVTtknzIQdYY4LQDVA
X-Gm-Gg: Acq92OF4RBS9HEkqJVqH5mcd+att8SY4iNiFl5S3j4XR9Q16d4sfdHGs7VDObjNztFi
	RYAwkm6Oi0eqyNaaLgQpE0yRr3gGY1C22ccYNWDxRiCaywFRJ1O0GbQYxsE0eBdvr4hMzgvJfp1
	sGxG0qrYnObN/FldizSRLPVjGzqdAZ8WAGOTQQe25zPFZDxcvODYxtx5VO5+epj8T5joec7rq99
	cUv1Qf9tteVVGZ6oNlu6f3MFCTJWEC+DDgM4ft8jX+43c6QX9vpLXqHyLSxFpIgDmB1FvDKWi/+
	7LZ3JLclO4IrsOR5xMFIWfXzZNp2MA5cHRUe8hZFrDa3kzojAxGeyYalnVzDOxBWMtsZMweKi6S
	pPhIactpdV80JQ1Sj40VpmXgnxWCNk4Gen3jMaGiXc94Fo9C2TNquMVKEHz5Zo6g=
X-Received: by 2002:a05:6a00:c91:b0:842:4327:6cfb with SMTP id d2e1a72fcca58-842b0feb656mr25453842b3a.46.1781092956751;
        Wed, 10 Jun 2026 05:02:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:c91:b0:842:4327:6cfb with SMTP id d2e1a72fcca58-842b0feb656mr25453772b3a.46.1781092956257;
        Wed, 10 Jun 2026 05:02:36 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221cc3dsm24523372b3a.1.2026.06.10.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:02:35 -0700 (PDT)
Message-ID: <0593ec29-b670-46e6-8eaf-a146e96a719f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 17:32:28 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <ujf53zya6hes3hkddhsmgu4wyabodnyg3zdwarxmcsoy6p5h3c@ild34ppiyvre>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ujf53zya6hes3hkddhsmgu4wyabodnyg3zdwarxmcsoy6p5h3c@ild34ppiyvre>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4W5EzBprQiLZsXQ5sfD_fXWpH1EmWOt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExNCBTYWx0ZWRfX5AAt3PVmytm9
 qaKY97Z3wVatp4oJqKkuvyrppx/0FgPZ3NLbrKzzZuOv/tpfDth0tsVkkZy2nAWltH82/uYv4Fm
 AGE/plS0YNBSEz3F4CN4WFoh+HAxkMwzm4dXG88AUMs+XEb8tBTF+ybvt5au31Km+xdNXX4byAc
 dtpObwE6fQsRcT9DhlMQAd+gUFCljLz9WxdwBMU33FEJW7rDfkHyC4xf0g7Bj/2JE2wYmUKopK7
 Cxeev9VpIr60dXe1rYAuDbyyeoHWUgvY2/uXiY+Q8x6xwUYh+Jd8G/L5UosUC1XAz+lHhDxab8J
 z6yFybRU2vKGQMbB7yFlLoE8hixwv/kklLy68Z0f3jM7UaCeuG0VeSae0yTcQmvgBf4oPMLlo4T
 ZdsqaTjFFiZLnAQ7TJXk35m6uTkQz7NSmetWwYtZTMIFfDinSg1MrKKCUEfBHsO+Kk5yzU8ThQI
 CXL3aftD4ka+VBW1aIA==
X-Proofpoint-ORIG-GUID: 4W5EzBprQiLZsXQ5sfD_fXWpH1EmWOt9
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a29525d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AQWUehsJRALLLA6uX2EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100114



On 6/9/2026 4:17 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:52:56PM +0530, Gaurav Kohli wrote:
>> Document Qualcomm PAS remoteproc thermal mitigation properties used for
>> QMI-based throttling.
>>
>> Add:
>> - #cooling-cells (2 or 3)
>> - tmd-names (thermal mitigation device names)
> 
> Describe _why_ you are performing these changes. For example. why do we
> need to handle two different cases for the #cooling-cells?
> 

Thanks Dmitry for review, Ack.

>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,pas-common.yaml    | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 4607b459131b..0d07a0750762 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -79,6 +79,20 @@ properties:
>>         channels and devices related to the ADSP.
>>       unevaluatedProperties: false
>>   
>> +  '#cooling-cells':
>> +    description:
>> +      Number of cooling cells; 2 for min/max cooling state and 3 when
>> +      selecting a thermal mitigation device index.
>> +    enum: [2, 3]
>> +
>> +  tmd-names:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    description:
>> +      Names of the thermal mitigation devices available in remote processor
>> +      subsystem.
>> +    minItems: 1
>> +    maxItems: 5
> 
> Missing example with these properties.
> 

Thanks, will add example.

>> +
>>     glink-edge:
>>       $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>       description:
>>
>> -- 
>> 2.34.1
>>
> 

