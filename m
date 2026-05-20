Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679D2E0925
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779250326; cv=none; b=sEX2z0o1dW+13NBF97cU9jSyWxQaCHp7fbG+TMckRO6+hWbv4Zucw1/w4hkEr2ei6tuOhxg670jalVdwxpH79Y8vX4GqS94OU/hS7778gN/mTLFEM7Ibua9D2uIa8RyfZdkfGEmCXIsxPZplPVA3LGdklySwIGKrQ4exf1uLOQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779250326; c=relaxed/simple;
	bh=hRI6xWNJhE5ETvgqRxmnzoAXjP1dG9fiu+8Iq8NoKVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqQFpp0TpeHji7hTTkgBkVKmWNt9WYOgOwPLpEYanVqssObBNhNmaLz75qQCx2UgvEwtzflLsbPjsY5n5MBNNcA6lIkn407zxxvkamMcXE4l9JRk5BF3PE1jYQ3RU7aVcWt5mt3m1GGkVVJClJbSSR5VFjE0jyzGVsA1vm9gPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvNIbbCC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/W2xhep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvNIbbCC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/W2xhep"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JMK9Qd1725720
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 04:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=; b=mvNIbbCC/Vgc7nXs
	kN3VOfJo460AA0qwx/oPDrMtQUcpyls0+QNmcRhs/j9pOxxqnCPTPQhIoSZk+gMx
	Q4QcQiLM+Sc7Zk5DXRxDSWsRvvuKbIuW9pKBN718ZQYiTQYo/UvZHR31OMp9lDYD
	NCDTiOy4mhRRXqObO+SKjC9BYkJuA3wov+1+zUP12Emd1Pc3N3K4fcTQdVyMV/fR
	YLQQZxViyC03azYq5JdpkARKikuKTrwkHaT5e/iQ3EEM29tL50+ARFhL4PYZ9ZxR
	6OIiUxmWKJk/x0XafkrcBLNLlvVKPCaLfPGDRZTLfed5bq+5q9YjDRGqgVZKJtHR
	7Ercnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qjv3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 04:12:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa366fb79so6058318b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 21:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779250321; x=1779855121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=;
        b=a/W2xhepNSCollPZV7nHb7NIEs1T8hs/wz+dNB6pbgPy0M/WXcP8M/sKCj8XFvYpcR
         aks66DHQEf+fjOE5yxju3I6ChRl+8PH6j8hFxc2IySponuQ7YTShfkgJQxXJbO4Doa2o
         5vmJzmkbFBlzR7irBZgjSbpzZD+B9t3xZ9j4ndmDAO8LpO5aqjBOejgzvctfh2APB1Vg
         g8Xogj9NwBEPCWLXgid3vUKx9f8O0kHIA/Q9uY80gLdAOn3oDWnMlaVZx2vhNEztjdkD
         cx8nhFoybNGORg1anFrnBtDGo/C4ywJ3GsvPNVkcsciU0AGzWSn6Sg51nwAmRAoMOEgz
         sU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779250321; x=1779855121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=;
        b=Ccz2lXKoKszS3+LAWA+l8T1ug2+HWC9BQTfddFOsVJaKU4PkSAp//85e2gLv2w49T/
         NRRZWxtK1DwnyzUsgUY+sZlcabzP6BaASh34j3y6BFmP+k2klcZxBt/Nr8261bpfAm1r
         c7DAGuirAeD2HeifIxY+Y0jXpEqN2JZx1DZEsqu6qnmT2Yk405TfMcrVn5g3Q7HIeYS0
         CCNuf2WQQuCviF/347uPoKDSiUwsIs3TZJy1oQfTIiWymmrhSltfjWxiiR1aW4z1qOV8
         /wkf3nfMXZUR7gBmppNnINIkh/An1Q02jqX5BM1Eps6MWSpVwRrBDpvaE/8eLHJJZXe6
         OTrA==
X-Forwarded-Encrypted: i=1; AFNElJ8DyFeHYHS6vT/Ae9YMoVAHezh4FcGRO8VRYZW9p4hBVVDvqDqrMTkgsGbouppbwrYHZiEN2Eq+zcLvI+xgIPPh@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0AV3HqBxBY9C1NLwR5i/qDFh4c6G+G2ch/CzFKD38duasdHG
	HV99xraeCZI9vFYfXiaCPxCZaNe1bLQK2/IeO0z35yk1WLlTXWn3Yh8abgymqnoy0BiZu/FDwKK
	GkJQ42GHrNJWXCSbhIpUigj9IHzBgIHZjTKGJSRmwdht5SxPuvUQZtviZMUnNh0ogJu4r/o4h
X-Gm-Gg: Acq92OFNzx3zQUMN3Zx9TuKSgLEP7DuIoZP2CBEb7aluGfK3XOnflc7zh8mhWXSZtW4
	Nvh84yKFjHAAgKIPth4KrYLzX6oZv7Wr7onZUPqP61UhcEoQOTWsPm3eRzzaIAJMyUiWd+rwBCY
	hwJUBnl5K0iWnkf8t/4k0eNSBWLOaIfxBJMt1hNz0HcQTtPfA/KnT8ss2W8Ue/PdeXuLweZdzz/
	5PfdvAvnCu9rDwVqaQv/G41zu/zRaxJ12UEy2gR4fjfQnXlu/f178CU1ximymk3NUy9p48A7xoz
	ovA4VSkivB40EHyhTj0Y5RwXzRJjLHxAI7/1iBbxMz0SkJ6dil1lCxbb3CreQDEMu0B5puK2lPN
	QUkiqwcOIu2XTSHXAk/vTtJBjAO5yDJeAFtgZQNNdXTQjfPU5y6nHSuMlyyfnLS1wis5CCmma+j
	kXZHxh7yUk4lEDS3Sr
X-Received: by 2002:a05:6a00:448a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f33dee8b8mr22252086b3a.40.1779250321074;
        Tue, 19 May 2026 21:12:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:448a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f33dee8b8mr22252050b3a.40.1779250320584;
        Tue, 19 May 2026 21:12:00 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm18569319b3a.39.2026.05.19.21.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 21:12:00 -0700 (PDT)
Message-ID: <7724b8c5-3822-4b98-a29c-bb4a99dd858a@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:11:55 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi SoC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        shengchao.guo@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>, yijie.yang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, tingwei.zhang@oss.qualcomm.com,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com>
 <177918447247.2753487.2425115852853158786.robh@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <177918447247.2753487.2425115852853158786.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAzNyBTYWx0ZWRfX08dvi/BRvwz7
 qJjOqWZzNlM+i4Q5Z0IlHBuXiAy0ycDuA67Ph4dGAuJSSYWAy7fJpLQ0IjwR4vqDvUjHHj5klSN
 zJ2i3HRQ/NLZF8CZFKPKVkrLpx2UAyCuE3aQs5poEjpsqnFGykbg/EUVKTSP/QENAd0+Gl+Sj18
 7SwISYLQDnfOycLdSic/j8Di7AmNRo5iS+wQNjYYsKKGh8KHKfOVzZbiLhVlMgB3Y4G4J/zK5aq
 A2tSkvNCdaMPpigfCVw3LCHpzXS7krDIOa6vPqtFgOxvFbtxWsLP/718jNyMGfIS7FKQgwMhNkB
 Pd6nX+ozgpl0PMcoCPFH3CqzTbtiOOaYat0Xgy1V9tWrNAEJHv5vOxSqGZw2FcTgDrUHQOpW/aT
 /Nzrd9Yf0YbIiTnmx0EKMsPyWfkOgME3NTcZAJiNA7hm2pZWeldNlJDXqWQl1sWvUOHvkEh+51H
 oI4lfpM8Os/Li1mavHQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d3491 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: lXeF0naRBVYxQNRiLETKOpIpXfSvpZNW
X-Proofpoint-ORIG-GUID: lXeF0naRBVYxQNRiLETKOpIpXfSvpZNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200037



On 5/19/2026 5:54 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 19 May 2026 00:24:22 -0700, Jingyi Wang wrote:
>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>
>> Document SoCCP remote processor used on Hawi SoC which is fully
>> compatible with Kaanapali.
>>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml         | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
> 	'items' is a required property
> 	'minItems' is a required property
> 	'maxItems' is a required property
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Hi Rob,

Will fix in next version.

FYI, seems this err cannot be found on the latest 2026.4 schema, need to update
to the latest 2026.5.dev9+gdf9ad30c5 dev branch and reproduce this.

Thanks,
Jingyi









