Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC443AFD00
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202998; cv=none; b=rlJoVoD7lQZHksdKliYiTnJoqB87MqGUxDzGtlYyx106PgI4IwwZGWqeJ7C29vC3bXwbvbSx5cmA79K3/zn9Z+eb7DPGPbOHxkbHOu0a3f3XHBAc3Vo9t5/nb0gcD3n8DIJqMVmqWubPWIB2RH6N3MubY1lpZyN0n/ftyn1sPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202998; c=relaxed/simple;
	bh=goujWWgxDAtQW0ZT93RntvBrZJtIcLJ/PvUYvvYOj1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qf0OvpS5Zoto0sU9AO+tvrBGe/9/YyrP0r2irF6zh1CTNREjFLM0ZsSanOzTWkM2SaCGgvoJVaKOiLatzN1tw6AGWpq0yU97D178frWCiM0htNQzQGZVnGlz56mJ4G5fpOBV1rJ89uiEo9upLsnPDEXn/LIpOwO5i4msHk6/iPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHXNz3Sw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BG/n4KUi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHXNz3Sw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BG/n4KUi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwm6C1725708
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 15:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHGL90YYCdoIftFeeZBzlNxa7STv1/CtE4HjA6UIQ9U=; b=WHXNz3SwSJSCYQ+s
	7IhJEqNVgCyByrk3m3ETi1RAAK8rw37mdOM5zyT/qdbXSe5NCyc0T4fdWaMPh+CZ
	8+IE3Apt/t5mK8p0cz6Ju1z+KQlfxDjBSBKUMS9f92VJFdqE1MJLkXHluW/EaTYD
	Tki68w+zlgF4uKRtCOw667m0TBKZLfnFzI7REiGveDjs2AHqx9cN96OllftkB8/9
	PhCsnaTRdIXx+yc/OYpSixmMrEo+geli3WaiT7gmW/D/Goe1Ej4d7F71olOjXIlG
	9RPT32szx9qWe2/NQ+BXPE413GJXqCoqDWckhFkKsX2+jVmcGOLaO+k/7Kc06LJZ
	SefC2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qg12n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 15:03:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so28178745ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779202995; x=1779807795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHGL90YYCdoIftFeeZBzlNxa7STv1/CtE4HjA6UIQ9U=;
        b=BG/n4KUi6+5JdhFFbCxhJkxsGpSO1gkSq3rIxGxP4Am/JVXLTz+jRTX/7ZmyzW9w/u
         N5HO3Cs+SJAIZl/1Ri/CjcNoZmTQ+mEf2VLXt+jPhXZXUNdhiaM3yD04nmdo2UsN8ygA
         toxXdMv6payCLvRnXR+ZDsquHi4SRYYqz824J3BGcwITbFJpVVM0zGTyjk2TeAyLzXi7
         0PIljtkkLCKuGTG24pDHGER1d75PNxBqbnPbS+Mw3l1rn5mvpxNJs2X1pbNNSc5vIKG8
         jHHXGWQuyuGQRFkXjnUSvMJVGV1dc0s5YoCpSdkPI2rRDprvYw2uSJySLbU5BgNMhtb6
         Hp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202995; x=1779807795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHGL90YYCdoIftFeeZBzlNxa7STv1/CtE4HjA6UIQ9U=;
        b=s17reit6r6WopLw0u/o/Z6JqPf3Vdw2dQR3tAUxwDz1mRvZpHdoKQx8JStQfJeeC/C
         ElFSRi/oQgex8JVezYuRQ+9yVa/UuWhDBUC/F5hjfA46Ac/WqUGtx18Ruwf0Yjm6F8IJ
         W8+eW/L+BTQBquQkBv5Ry3vOYtveZ7l4G3s5ajCObkIHzxPei95wtwAQVj1r9JR+yi7D
         ijuv5zZ7AY/SvKXT5Orwh0i3r1o4h28G7tUzbvSthENXNMO73CrK/5doEx2PJsn/XHYP
         YPn1X4VeK4HhWpnvM+qj7YSrszwqLq9b1ZnQ7ToON+Ku0ZVit0UT/HeLdMR7zkJmoFcT
         4lHg==
X-Forwarded-Encrypted: i=1; AFNElJ9XxO8G64vcFLPJCY11uMFMVD5/gs+iLWFNtnbjIMdezem26y2Uow3ScIC8sQPJ0td1DDvsM24X+awP4FmL7lTU@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBC2eDOmV18DoQ+VLtgTft0uYsymCK0mt5PG9LtXCdm++8C/1
	MzrQue3qKLpjXwkvhtLjAjZYqnNTKsadqVxuXo+cJiA0EBZZB8I5m8bdu34ryOlce72EZQJgSIe
	2TRtMn0o404TB3fxTE5ja9VkQAkcUO1Fffz7iNDkuImI1V9YpFEyAnm3ih68Sfjvw6Ra/tcnO
X-Gm-Gg: Acq92OFRnIicAV+kI8OWZf9J6jZChJl07n93llc2cfm47YmB78vcA3s8f97lzgzdrgB
	oN/zGFiaSBMWQjbw2My1n/i0L9ftzzjkxj8EhwzIyIBRC+sjekM0WQfltZKMiUX8Zxk45tGY7YZ
	wxRlX/cRxQGuo6uiktG4AflJ9GZJNvOCnEfzfSBz8t9Q8T6tF9jFcgV12nDV8kRhX+hLewjBTcA
	WCeK383M5nPleowKEun9d/TQMcf5//FQ6cCife2OAxqNWTo72bwBQ0FG5LOOuIxhBnL46hsfDR3
	2mVr8I5s0ZViuGHpMDatolAlfEPhxsiqfkBT2rzvoLIS9/YoWLTap/UzpumkwsRgZtfvLE0tgSP
	rL2886PQ5AzhHzPPdV+TFh12/y5pnrSq6twWY1BjyDTiivQ0S
X-Received: by 2002:a17:903:280c:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2bd7e991520mr120248525ad.40.1779202994469;
        Tue, 19 May 2026 08:03:14 -0700 (PDT)
X-Received: by 2002:a17:903:280c:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2bd7e991520mr120248025ad.40.1779202993930;
        Tue, 19 May 2026 08:03:13 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fbc05sm185598545ad.57.2026.05.19.08.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:03:13 -0700 (PDT)
Message-ID: <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
Date: Tue, 19 May 2026 20:33:08 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0OCBTYWx0ZWRfX2uMUclcbPqM1
 FTLKoRT/HleGDXUthbQ+URWm/QGpPHMF3b5NFTt1dNQzpnlnfpePFnsjCSV1+UHd6XNMxLQkX/3
 O7gMiOdcrAR9J9OIylxGG9yIgzznEfVBB6BrDZVnQOapcDzhwqnQHIJeKSUnUrSmVL2F9tU/6Q6
 /8stJR9r1V3PTBQS2nBGDZ0Ob8y1hkm0rm3f1Crdx4zeBqx9+rjC/QTvanw2nXD4Ri0duSiVpGh
 OQwX2lIDIXbARuZeCjZgEGaVTNQ7SLqU5c6GO1Z04IIc1+PkkWB5uOxIqo8Wr5Bc0tlr/2kLJ1Z
 vnjGE4QzyLULfkSF/cD4B5NMF8522D4MdoTSTLGBrvnTHfyc+JV91cXaLhOr0MkRBlMNxRI6ULj
 jVW61acDjH6seegCl6oO4iV9u+PM0qV14Dvo3D2/dOZwB1SotsJknuRhuDorkd7ivoD+eLmObfP
 zeuE1Mdpbt2O9DBGbKg==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0c7bb3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mpj9RaW3nZ1247zTz0QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: gJGzV3sJ1tUKu0KD9uMdEO_R2k4yf7km
X-Proofpoint-ORIG-GUID: gJGzV3sJ1tUKu0KD9uMdEO_R2k4yf7km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190148

On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
>> for the Qualcomm Shikra SoC.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 51 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da..4d43201b9ada 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1457,6 +1457,54 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
>>   	.ssctl_id = 0x19,
>>   };
>>   
>> +static const struct qcom_pas_data shikra_cdsp_resource = {
>> +	.crash_reason_smem = 601,
>> +	.firmware_name = "cdsp.mbn",
>> +	.pas_id = 18,
>> +	.minidump_id = 7,
>> +	.auto_boot = false,
> Why? It should be true for CDSP.

Missed this, will mark it as true in next series.

>
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		NULL
>> +	},
> Hmm, SM6115 didn't have proxy votes here. Is it requried?


If we refer to sm6115 remoteproc-specific DT entries, there is a 
power-domain entry (CX only). So we would need to fix this by adding a
proxy_pd entry for the sm6115 CDSP PAS resource. Would you prefer this 
to be done as part of this series?

In newer Qualcomm targets, the corresponding CDSP PAS entries include a 
proxy_pd vote for the power-domain in DT [1][2].
Therefore, it should be safe to add proxy votes in Shikra’s CDSP PAS 
data as well.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm8550.dtsi?h=next-20260518#n6002
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/remoteproc/qcom_q6v5_pas.c?h=next-20260518#n1406


>
>> +	.load_state = "cdsp",
>> +	.ssr_name = "cdsp",
>> +	.sysmon_name = "cdsp",
>> +	.ssctl_id = 0x17,
>> +	.smem_host_id = 5,
>> +	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
> This makes no sense without region_assign_count

Ack, Would address this in next revision. it would be NOP in this case 
without region_assign_count and region_assign_idx.

>> +};
>> +
>> +static const struct qcom_pas_data shikra_lpaicp_resource = {
>> +	.crash_reason_smem = 682,
>> +	.firmware_name = "lpaicp.mbn",
>> +	.dtb_firmware_name = "lpaicp_dtb.mbn",
>> +	.pas_id = 0x56,
>> +	.dtb_pas_id = 0x57,
>> +	.minidump_id = 0,
>> +	.auto_boot = true,
>> +	.ssr_name = "lpaicp",
>> +	.sysmon_name = "lpaicp",
>> +};
>> +
>> +static const struct qcom_pas_data shikra_mpss_resource = {
>> +	.crash_reason_smem = 421,
>> +	.firmware_name = "qdsp6sw.mbn",
> Why is it not modem.mbn?

Previously, for testing, we used pil-squasher to combine the split 
images into a single mbn, typically named modem.mbn.
However, in official Qualcomm releases, the modem firmware is provided 
as qdsp6sw.mbn. Since Shikra now has proper released binaries, switch to 
using qdsp6sw.mbn as the firmware name.

>> +	.pas_id = 4,
>> +	.minidump_id = 3,
>> +	.auto_boot = false,
>> +	.decrypt_shutdown = true,
>> +	.proxy_pd_names = (char *[]){
>> +		"cx",
>> +		NULL
>> +	},
>> +	.load_state = "modem",
>> +	.ssr_name = "mpss",
>> +	.sysmon_name = "modem",
>> +	.ssctl_id = 0x12,
>> +	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
> Again, this doesn't make sense without region_assign_count. At which

Ack, I'll address it in next revision.

> point you can use sc8180x_mpss_resource instead.

minidump_id is required for Shikra. (decrypt_shutdown is not applicable 
and will be removed in the next revision.)
For minidump_id, we still need to use shikra_mpss_resource instead of 
sc8180x_mpss_resource. <?>

>> +};
>> +
>>   static const struct qcom_pas_data sm8650_cdsp_resource = {
>>   	.crash_reason_smem = 601,
>>   	.firmware_name = "cdsp.mdt",
>> @@ -1571,6 +1619,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
>>   	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
>>   	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
>>   	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
>> +	{ .compatible = "qcom,shikra-cdsp-pas", .data = &shikra_cdsp_resource },
>> +	{ .compatible = "qcom,shikra-lpaicp-pas", .data = &shikra_lpaicp_resource },
>> +	{ .compatible = "qcom,shikra-mpss-pas", .data = &shikra_mpss_resource },
>>   	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
>>   	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
>>   	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },
>>
>> -- 
>> 2.34.1
>>

