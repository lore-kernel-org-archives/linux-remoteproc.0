Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C9436342
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885509; cv=none; b=ZrIumqF2HQKtgTifVFVvLeiRHRXHizLs+6gcziHvcfBk+fMIywdIfxYqRFP7H2IKEk6UXTk1QHxzqND9Iy5NL+6OfsfJMn5j5qqj0HfAF5Yz4VtRoemssKVy3lY4EgeTx2f+ovrLnTdktTME6e4flB+HYvwfcNDksJSCK3YyJ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885509; c=relaxed/simple;
	bh=2dPTRel0DT3n+CZtpIwB+FFkdaQRRQzMwPcArTP1QWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTvfSW0aWke9naPlHGiQeeQJNsgKf7dI5oKOIEk0Trg+2gfKCpzQqOQOOUH2pyIX53sKMqLpw2ZjtxTl4yqTA9psQYbLROpOhzLywsJHlbxsmbthaOjhplT5FXAF7+aqaRngful6H2Kgv7Y4q+7wSW7mzWewJpRpvgDBEprQb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMFT0x/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=excWAuUf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMFT0x/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="excWAuUf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D947F3483092
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 09:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=; b=JMFT0x/QhIve9LNV
	RmsGXNrDHU2YziJBpPE9fojAYA5Jlxpqia/OMl0DCTmM4Vl6Rz7z+t79fi9EBST2
	g15yrL/S6MtccbBV0xXN5SpU8BnQIUL6MEmSaC5IiiczaBxxa0jihurViwK+hty9
	400HpHg9UGE04+4QSpWuF+29YTNa57KpCLETyc8s1NOuLQGE1Qr1Im5af4fUGVx9
	Ht3Igqu6DWwFFxVMdjFn+tR3V/ezVw1kVP7GyQX70998I5/VFZDwb0k+DdP5g5Ec
	xNhrwLqRS+QiH+7xZjs1I3AkFA9PgCT9c3fJvLgq+gvYyvKBflej7rC2uJfH14qo
	UyPNiw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg87jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 09:58:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so523638eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885504; x=1792490304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=;
        b=excWAuUfiiIBGIxsiN1IfOcLviU2/tKZZlI+P2SxChi/xB0A772QrcNEwA0LxUoWjJ
         OpmjovHetBZIv6F7zF018T+wxnfIIqL2fvRUdSEoiIdEm1aDDdRYYMbahLn1s1XY8KnN
         dyuB8p1ymZxpELsMP6cZb6GDQs2Z2jN3WSLOauHvZRapfU9LZBKRH/hv2wv9rT5cw39D
         eCmpF9W3wc9lCjdM7zoIH2w2H5xrFSqaWZ9/i1k1yI1tD2/rno32WAjiTXiGYGlJG5qk
         vbwDe61/BoS0k+NErgbO+o1H9RF7yTBJAsjnW/JnhwyInHZYXnkkY05cVkrYKwcI5/3W
         caLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885504; x=1792490304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=;
        b=CfRE6b/aLKFG1H7VeA8Zv7mzYgEEBaWQB+i4YBmDuNm07x/MMGz5c2RrV9DK/LuidL
         ccTAPqMQ7vaYq0jCBrRqRLARnhHVWvM73GdpudhjIS7L8gL2zgmAyk8exx11w+45EmX4
         KMoUuF/dWSCeeN4TG+w3wbL2zobx7J1+S+VXC/uecDjfNLVOJHDxPTyZpt4qxSCk/cHo
         sCw7wP6mNHIq0z7ggQLFsxSxiQibk0DWKXSEGo2uwyd4gpzWJGUj1keXBLZgfkSChWNX
         6cW1+btBbkoo7O06YZSNOnI4t8dS/k1+MWSONqBE96NB3tZZiw8dqi9z0OyhiETMRcM6
         hPKA==
X-Forwarded-Encrypted: i=1; AKwUvBwMbrcOgLZRQdUkgdwyliV2BOBdrhjYAprQwd8PAILqBPZbmIFrqBAHc50jjEDhooUO5/V9NC5EtZXw5XJzsWzv@vger.kernel.org
X-Gm-Message-State: AFq9FYJ08UoAm11Y8cH5KdQBLpPXqI9/Pcrl2CmCelVS3JsVcbUj597C
	ZeixujK9cbIHFrGGXAkD+2pvFG0Un17Y71igLu2dQbKJxl4ApGma9LeFK7Ie/pneJkINYaSl0KO
	zbla5nam8qvg1oQlhqRZNtesrDzGa6QAUDvV4jUd8eGZrJPjVDJ1ia9iuhcUkFdHywf3nLTS9
X-Gm-Gg: AYBFou1mO51VqaSXCxy6vVW2aklUMmzdBuUCyCk0r4J1dOtxLnZRYLEftgY/bUwfOZu
	GWtjLdCBKslrLJBtGpyQH3g/n8t78EBIZ7x4dk+Ad8irdKa5/ybaszCUtsEsdH5CW1zw4Pih70G
	MULI85Y3qurvoJ9ay+gSJgoTQ62e8p830J+hB/Cpk/ahetgx4CNq0AXwphzrpU3+1oIuGCtNb3z
	QhJ1Lqf2nAAeEnPeMvnJiLrLwspcJ1bFHNJk70fK7FgnPO9yA6rkEELxoJHTaQXgBF47j/YeSNO
	H4uc80CjAU9GF9CE4WTgDS5uuRqiWQWrCzyu59eL5oFxJXzQ8SGDEoRBti7JDQKPjWFZlycUEiv
	eW0DwDUr8H27RpKvXL+klXnyBDIoVgyo=
X-Received: by 2002:a05:693c:87d5:10b0:351:433a:acfd with SMTP id 5a478bee46e88-3537e0796acmr16646922eec.38.1791885503455;
        Tue, 13 Oct 2026 02:58:23 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:10b0:351:433a:acfd with SMTP id 5a478bee46e88-3537e0796acmr16646878eec.38.1791885502644;
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
Received: from [10.216.22.79] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm27114030eec.8.2026.10.13.02.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
Message-ID: <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:28:16 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1p3GPCj5ZxOAka_SgyJDvbLEqPNoEdLT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXz5loukE0Qv5x
 hIszXbtsFJP8rU0IHrk1lkNZYjMip2OexkJvdwAwsBbS5WESHh+BaaJwIgJP5UkjdxahbkxRk13
 vEdzO18N4MeGOYd9scI04UbjBMVrcic=
X-Proofpoint-ORIG-GUID: 1p3GPCj5ZxOAka_SgyJDvbLEqPNoEdLT
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace00c0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bJu89BRhDEOEog6wxuYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXyM30B3VXId7X
 IdKmZHoCXqThnBnVsqs6bFa+xNHz2038iyhkyzgZi/wkKXuWJxD0pPYGFOwcM4FTv9iLByDebMo
 RopJxZcK8dBmMIF829mCAvK5OVJizUwTcxV1eYAJIY89UuYHbLFKWw2uGVH8XCUWVcIT51icWsT
 tVUuR7QXgFr2oFrCDUaR7SBmfmoPn6fEhNhitVDzNYMN4IA3ca0dopvpDMZQkHSgOFDN0rsTk+g
 bG41NmGs+zNiyWJ1ws/U7hbHCR1g409++0Dg4q5vt0BW7kqLwfmSjoEUTKhlQ4Z0UIAyPflqI9H
 5t+0n92iR1Ql3i6s5bvWOxfHNKnP7oER8S7Zywbgq2HbV3xCrpJTPucAd9K9gvarQhkgmo3QHyp
 ZMl84K+82nqkZMNE/+C8vzlbDecus9LV25YKlRAfC9nqw78hLdw8oGcAu2dyMu8BSjcRvsXkqH6
 8Wi6ohty8pYSCu4EJbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039

On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> But that's not what it does on this SoC.
> 

Yes. I will update this in next version.

>> It provides a solution for control-plane processing, reducing per-subsystem
>> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
>> platform
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index a005546c265d..6fa958044218 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>>   	.smem_host_id = 197,
>>   };
>>   
>> +static const struct qcom_pas_data nord_soccp_resource = {
>> +	.crash_reason_smem = 656,
>> +	.firmware_name = "soccp.mbn",
>> +	.pas_id = 51,
>> +	.proxy_pd_names = (char*[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "soccp",
>> +	.sysmon_name = "soccp",
>> +	.auto_boot = true,
> 
> No DTB?
> 
> Konrad

The base patch isn't merged yet for nord-ride-embedded.dts.
we need to enable for both rrd and ride-embedded boards.
I was planning to send them together once nord-ride-embedded.dts is merged.

Thanks,
Anurag

