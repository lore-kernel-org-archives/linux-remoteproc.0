Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3CD305E3F
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334118; cv=none; b=NIZJgL2FLsA7nlm0z34QU1HcA0Xt/LJ/LI6Vg2aK4O3IYY5J0iqA8Lo0iRFNOLKT6tUS1HeQVRvxWpW3j/N0divxxYO5+Wbmld34TmyAZib+DjPjU7Kk7IMyWw5oyYeacU6LDa+e6SItEfoMhqfFm81KaLm3+FUp/lapCzS5ga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334118; c=relaxed/simple;
	bh=sWj4L7rhHobdbMJRSjrMT5uXvj/hcYdysU4hDlMLJY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLfb5EoWdkowelUk/cdJCsfyljCqWtTbDtg8oifuR+zHC2yeUc6yBTRKcCUm63xBN6aNYFQkVl/q/AfJFW7ZZ+DIEFDnlvVMnUqbHjlFGzqsyxLtxmRw2AK5sLhD2U0uv4qu+wIdb88pw9MBel8WPtdItzNKrpJ7ptWULBtS4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyq3fs5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW5/wl66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyq3fs5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW5/wl66"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A586D382927453
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Nov 2025 09:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNO1o1W8xxRWQs3VWl/BSPCCofHOJOL8K7pYPyBtsdU=; b=pyq3fs5k1EwmNBb5
	SbuQ9BBryy/yy9ZIvxAJphDY1eSrYrf+oSoBI9avapGUN5os6inBTFI/wCnp8y98
	2MP9eb927GxbjgM7O0uxDr2vP45rtEBfSFY9l916nPQbsGDUwK+XV/wbTP3U4Cc+
	/YvAKbLCW/DAriVdCDlZKR9ek6ju+r/3AyP3/efTcrJQayuLWvh48msqp9lr4m7v
	GjvsusTvrVM9b5emgMLacpZGBsHnhNFr7foyAPQyhSIOGGSZ585kUmkmFhgbdh4p
	bifEwdaZh6uOKMDY/nXfNJzORowqcyxfkPfnyv9WjLUXj88DREKdLO9kxPmYWDCu
	WqKoPA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5trdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 09:15:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8801e2653dfso15221736d6.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 01:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762334114; x=1762938914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNO1o1W8xxRWQs3VWl/BSPCCofHOJOL8K7pYPyBtsdU=;
        b=DW5/wl66RuKMArp6/OzI4dcm93NEjOP6jGCP/CjndYxUtKbr1owW3RfqjdIAhdrgwM
         gMgMAQ7v+EDu8TolrxSq+qnUi5ooRb5DK2aG4Ulwc4OlPFb8OWi6zaCaZFEU3I+b4o2w
         pzRuUBGBhQmkYbRqnBGz6kR2kVyILzbHMEr5yii+FCOs+aojBAYAVvwI1+1cYo7KFFq6
         CCTSw5kxHpnyu5EujeiSZyrNU7wOvomvb4KSs2zWoennCOLnSDujxyj0AHDArjhXTOSp
         0bRjsL0JskF6WyAN3+APg1qxAqpG5Gz5dw+5kZfcNzEC86MBIme5AF86gWIKOps0t+N2
         sYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334114; x=1762938914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNO1o1W8xxRWQs3VWl/BSPCCofHOJOL8K7pYPyBtsdU=;
        b=Ryh/Hjwynep3Pnr232GVPmwMu00sIg59wpZHYxJ2c676WdpBqHyrfm7VFZ48IuFAXy
         RR8h6jwwVacwkuw4ZUT9KX/TbLmO55R6KSWy8uRi+Crdgv3XV2CCjplIITFm+tqwvpt4
         +PkMBhkLncPciq3EL8snJgZtS8O0Z8YHKNkyoP1FBflWO5wdU0u4I7UzjyFdHEWJC2SV
         1vt1xnvw+ZDCu4uOpjAGanQ1WNqyPbuinC+sSngKFmSBxNa7bjtdqRNxNEHa0HPtgN+k
         6K3nKyIYBwo0HILGga/PKSqStd3J5HGNKIL7kF0C9sEqA6WxTVjT7gKkfA/CJzPFAvUv
         ybcA==
X-Forwarded-Encrypted: i=1; AJvYcCX6vMUyKDFvbK7BlG2EslzLYMjm13TWdVzKgfjYhsQgeOzHb75Gt1zC8OC4KK4PnSln1QzS7O6mCR3c0Mwep1MR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HMWnLHsDwh6LzrUoxzw1GkRkCHyUtHKrOc57hogS78Gk8XUj
	H4Ucd0B23r2070tUT/14MKvDSKOQ95rHZ+4a7lIfK64jopwZyIwmyrAbIbCNkytAlcaaJ+4hRiL
	B9a16t8aI7Hhv6ims4GnlEFgBJQOdo4FTMlNxA96CvwH2dpJtWPolY2lLA+BeJKnAuAihCTQa
X-Gm-Gg: ASbGncsene6DwmFht7K4pRkNtraOUXOqMvVs+hc9JGiJwNxWXy8mc3vMZs3TmTY17Bu
	O2Lysz+YW+2jTx+uC7SUFmTm0hJsfDI1zj8VFRABKzFnZEsYNlRxxfvMB+O4YloDa2rCzgcmADm
	CjiTwjZgoyFK9/uykE5G622ypTKCr54ESMCLP1boJdrBjT/zkcLB9L2nQHm+UFpq/TEntJnlEMa
	2pqBY7iZSlAFEz+YfJyatdWmIpKkqrinK466mwgbqc8P7BQUjtQTj8E9rVrxEPUSqFwhQlxrNci
	IS0al+NpKLdqKvM01B+6MSCiglVOix/toSGj8JrnpB67H2dbuXL1j4o2pbBkygcetnDwOWsLKsG
	EX9ecDZbVEGq2dRzUhkPYY54uM44PBQcdtpUvSiksSuUCBsQT6ZyS/Uqb
X-Received: by 2002:a05:622a:1b87:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ed725b2536mr21086121cf.10.1762334114386;
        Wed, 05 Nov 2025 01:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKCyR53MAEhxPCCJMTiIIV8STgK2JXLFsaUXOmOdyEzKsbeVODCnY7EWuvHFpinlf+crPkeA==
X-Received: by 2002:a05:622a:1b87:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ed725b2536mr21085841cf.10.1762334113881;
        Wed, 05 Nov 2025 01:15:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640ed469107sm3508933a12.17.2025.11.05.01.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:15:13 -0800 (PST)
Message-ID: <cea360ef-dd73-4f6a-aacb-73a1119ae43d@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: remoteproc: qcom,sc8280xp-pas: Fix CDSP
 power desc
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com>
 <20251104-topic-8280_mxc-v1-2-df545af0ef94@oss.qualcomm.com>
 <20251105-dramatic-denim-kangaroo-cef9ed@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105-dramatic-denim-kangaroo-cef9ed@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wPTIMLzcsjnjzAhKqnnBpzmJJZNj-YRI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2OCBTYWx0ZWRfX/vUe3rhW6m2v
 QB3a7xnCzDd7VrMroCBez9zmC6ORvhCfhnO3f52cYFzrO0WnMZXOPuNSCoVMwHjQc0T1wsi/bcA
 JOIb5C1BAu27qWJfMJixQ7o8heysmi8O2kCfyFrGmer4WXUh4M/acVVOGywB2quGijRvFPxBVl0
 EZax91u2MH9dgiWAzdRkJu/PdVx00shXD92LRSlydSGLNcD7XGoeS7tVhVZ1q+pRzmKehqWURd8
 zmAeaWYdFBZUOfUe7LZ2TMF6lXCIQy/3J4ZNP7/BT6l0lPNbfdnRcPaO8Vz5iUsOJ+fjcD6M6jo
 0U3HTRhrbFGFy2EN7fCCbHfXfJzJflrROI/fQauNQN+AtvoXfABej6z6w5fvx5IB9h+4diso7uS
 Fz7VgS9950OeYSqueBUQsCkO4DUsbA==
X-Proofpoint-ORIG-GUID: wPTIMLzcsjnjzAhKqnnBpzmJJZNj-YRI
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690b15a3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w53bJKq3yDHGtliSC18A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050068

On 11/5/25 10:14 AM, Krzysztof Kozlowski wrote:
> On Tue, Nov 04, 2025 at 08:31:07PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The power requirements for the CDSP instances on SC8280XP aren't fully
>> described, with only one of the three present. Fix that.
>>
>> Fixes: ee651cd1e944 ("dt-bindings: remoteproc: qcom: pas: Add sc8280xp adsp and nsp pair")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
>> index 96d53baf6e00..5dbda3a55047 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
>> @@ -91,9 +91,13 @@ allOf:
>>          power-domains:
>>            items:
>>              - description: NSP power domain
>> +            - description: CX power domain
>> +            - description: MXC power domain
>>          power-domain-names:
>>            items:
>>              - const: nsp
>> +            - const: cx
>> +            - const: mxc
> 
> Heh, so if this was described since beginning entire binding would fit
> 100% into qcom,sm8550-pas.yaml, instead having this now in different
> file because of different order. Not great. :(

Yeah I noticed the same.. It's probably not the last conversion like
that which will need to happen either..

Konrad
