Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37023AE93
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125980; cv=none; b=jR2gJY1BYfvQRU/e8nkxoAqgj5HoXj+VzuaiceVg1EjJ65kb3qKBQk/4t8yBinQ+p5GhDK4mcrYtWmYPugtfbTp1zUt9oUuyN4YmHHMaP4WjTGGU3Z7URTHDm8OREhen7wuNHIdYBIUklHYocgYGwFdLdRGTJG9up+G91iWvjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125980; c=relaxed/simple;
	bh=R1hOZFlZFY7ahQICoW9mfCD5k6/twe3bR2ww9vrXT3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REzmWoB3vdjwodLiMDiA+O29MABQK/bDt3d3IaYP0BVpCotpgvJOlH5Fys4/n7/zLlC+yJzgn6T9dja9rRW8OeIiSAsC2Whf/Kg2bBQYn+affobsHlzYMr0dmMULZ4zxTJkj1t54a1wZE1gLI5cgwPxkpEDO+VPM0Uqr/2vkGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUR6oTCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUR6oTCR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T0PcpH017198
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0XpjhlKCQT5F8kJy8PyiFfpDsgcYYWrp+FmjNI18ME=; b=RUR6oTCRZ6j8OWTe
	v9adyTFiwTSoxot/syatb/FF3ga2I64NuyGOo9SWYM+Ek8ACA1Z60RE3qz6BuEo2
	K4YFA9pW4r/NM++KHDMxns5/E8XekFWRw2b1vXSi1L81uB4doin5jaNELEegAXtF
	rpy0dK2sgL+Om4dVsKlVqdVtj6dftwlBFDvCXHFdsSNYAnlUI3BupaGHt9zdV9+V
	aQwQxe1iYq/z25oFzje2Uf8cDUGZPcAte0yn2JewRsFbQEzSEkAy5Dn42jF/EKV+
	nTCOziE30UDvXFbA5M5M2pEg7r3zUhaycNJlBEwjlmYBvLN0HDyhslw/ISp7yYbx
	uFngAg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqv3p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:06:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33826e101ecso719754a91.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 28 Sep 2025 23:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125977; x=1759730777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0XpjhlKCQT5F8kJy8PyiFfpDsgcYYWrp+FmjNI18ME=;
        b=oNduw+ywKQ91E3WrHvZCQB5drQD5ssbJudiU6cehcrFqI5KYm4SsTsoC/B8P0UsvFj
         /SjhlsRXqAo2FBEogEtk04NF0TXjHXCwDAMyfm1c6XH7ZbZFsQonWTMYDJ06pBuiB/Ot
         lm3hqQz0T5jWIXzjDcpCh91aQWjeLmOABGwgZP6njj29Fu4zEL/sq05e3pkEtzqjVewW
         Me6ii6WCj9m17MBgGjbbzrjKrzkSfMO+4klt5cTk9CtmV0ZAdT0zlx+xcxbhW3dlhjBx
         4kLX13GUdwAY0FlUPW/LXgGispI6wB1YFHjO6PoxOWPMQIugwABqDfaQ4Pl9cD3COM3p
         4kvA==
X-Forwarded-Encrypted: i=1; AJvYcCXKMwTqcUfrWBzrDJvH1VTBep9Xc2BPfcA22tOjiMmkmvXtTQ229qgFWJBleI3Alg86O5ubjVFXYs6yznkn5+1L@vger.kernel.org
X-Gm-Message-State: AOJu0YxdmTJZYALIEli7SJejjSz3JtDpp2sYcrWrK7ZEeUnv42fuVMEU
	A2mv6e0zXuZXBhoy1KOoazCysoBAUk9NgQ1tp+oL+85DnePfnykjsBGIKygA/xY3HXyikxv4fyn
	PjpkPN3o+JA7ftHKWiE9c7owmycXvWt8ZWt19fxpCOZbc4wAwvZwHte35HNCEmKbD9+pf0LEJ
X-Gm-Gg: ASbGncs8oXuPQKqnzqy5l12nf2sg2fWwTysCEN5g1Fjsy47mjt5lj2yfB3DYv/S4+Ti
	IUcUc5JdPt0AI8+yuaO7iqiFcj4H8W4sGp+xcqmTZKrL0kp04AC3Nix8JQmkCnLKvtv6nYOzZkz
	f+Gr5Lo/L4RXpv2LpeTxdF//mp7+eutvDrIpJm4IxPk9N5IEkPRJotNeg0+Ou8KHG2NsgZhe+NE
	TQebgtGnzaRoKqGra39l6PULj9THe7wChphEvxqtAoVoIfTl9/LQcKCTkqVd5egpz8R8T2TiEBX
	cmEPt4Ni4QBMHehGlWiqQPiEXVo/kBBZz1QEfoCadV6frvmCF8Bvu7N/B8gwpC5xKxEy4w/IWyh
	vuP0uZtXEVPMjgf1Z5aLINxST1vnbDO7bcoM=
X-Received: by 2002:a17:90a:dfc6:b0:32d:fd14:600b with SMTP id 98e67ed59e1d1-336b3c40429mr8314089a91.7.1759125976476;
        Sun, 28 Sep 2025 23:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQVPf+oBaonVnZ99jEvDhUwui7DGxCtnmjbrzMR45Ek6O6rY2D4syi0FnP3OVmzqjbKW12UA==
X-Received: by 2002:a17:90a:dfc6:b0:32d:fd14:600b with SMTP id 98e67ed59e1d1-336b3c40429mr8314045a91.7.1759125976021;
        Sun, 28 Sep 2025 23:06:16 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-334326758f3sm6481957a91.2.2025.09.28.23.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:06:15 -0700 (PDT)
Message-ID: <d374036c-1263-42f4-b9ae-13b21427b01d@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:06:11 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
 <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 616e7fvUtFhKrYkUX3wcap9iH93D3z1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX/uxvEpzh41Bf
 68oS0LUc2iQSK8HS14VJd49UV929haIgUio/ulIDc4xTqJ/5JSzxgScXot3uPzHZpY00C0f+TJW
 G0+JRoSuw3b+ZyVEp5/fHRYZQ9VQJ+nHrISwxHb7IbtSMv2Bx/JjSouWWLGgoeZbKPDsHJ0L4pF
 KtwwZHbUEa96aEg3UeQBmdUklyDFi63yWoc+cGsDHolk0zeXOcyPL+KXPipJ1Cm5oi/uOrkiXmN
 +7QlaDE64fDMemklSTKppL0/X1U/LOHeAH9s9hwefQUceOZojJclU8eP4voGkAuryhN3XN+96IB
 oy1SU/eePY+aF7rna0iaXRdbYHvtwwEh0mx+2ow+3UkdMmv+/ukGYqmPHVGq6jwUXXEgz2URVWL
 rgon9jME0alSGk9jMcZAoL/27LviAQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68da21d9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VpiTcBU3MjFUXm55aNAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 616e7fvUtFhKrYkUX3wcap9iH93D3z1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017



On 9/25/2025 10:19 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:37:22PM -0700, Jingyi Wang wrote:
>> Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
>> compatible with SM8750, which can fallback to SM8550 except for one more
>> interrupt ("shutdown-ack").
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 2dd479cf4821..be9e2a0bc060 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -28,7 +28,9 @@ properties:
>>            - qcom,x1e80100-adsp-pas
>>            - qcom,x1e80100-cdsp-pas
>>        - items:
>> -          - const: qcom,sm8750-adsp-pas
>> +          - enum:
>> +              - qcom,kaanapali-adsp-pas
>> +              - qcom,sm8750-adsp-pas
>>            - const: qcom,sm8550-adsp-pas
>>        - items:
>>            - const: qcom,sm8750-cdsp-pas
>> @@ -95,6 +97,7 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> +              - qcom,kaanapali-adsp-pas
> 
> This one and the next entry are redundant. Do you see why?
> 

This one describe the interrupt:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,kaanapali-adsp-pas
              - qcom,sm8750-adsp-pas
    then:
      properties:
        interrupts:
          maxItems: 6
        interrupt-names:
          maxItems: 6
        memory-region:
          maxItems: 2


>>                - qcom,sm8750-adsp-pas
>>      then:
>>        properties:
>> @@ -185,6 +188,7 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> +              - qcom,kaanapali-adsp-pas

This one describe the power domain

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,kaanapali-adsp-pas
              - qcom,sm8550-adsp-pas
              - qcom,sm8650-adsp-pas
              - qcom,sm8750-adsp-pas
              - qcom,x1e80100-adsp-pas
    then:
      properties:
        power-domains:
          items:
            - description: LCX power domain
            - description: LMX power domain
        power-domain-names:
          items:
            - const: lcx
            - const: lmx


>>                - qcom,sm8550-adsp-pas
>>                - qcom,sm8650-adsp-pas
>>                - qcom,sm8750-adsp-pas
>>
>> -- 
>> 2.25.1
>>
> 

Thanks,
Jingyi
