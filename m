Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3325FA29
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Feb 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027387; cv=none; b=uwRN2L0erRYErzKv+gaUU0w06oHpM5HEgmdadgAwtsxpntxA7XA297EvhWASpduf9FblsOI92ZGx12UU5cbAI3lkT32oQ0Xstwhh917M3JjWHW4pEosLlktzkW8gt3qde26+2NhiM1CBS+6/N38SYAnIFwag6uGB01EfZ1RXIZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027387; c=relaxed/simple;
	bh=UGR0pbSiMwJMoCLH0/VjKOOJ+kx6tbM1ebts5IHb9QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+UgVf7AeP+b5jKD5v+fGUY6OHrnEw5ryzy14Jxw13IX+Gga7PshoOgYzvOpLHOVE+mfpVg2t00FpEEQ54eVkKSvXt5UMOX//p1MO9wL32zaD8zDHTUvh0dFkKH3/CONZsl2J5orlN9U3taChZS3TA1g4GmpbO6zpgqyViHf0Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw7sb/0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBqzAh6Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qw7sb/0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBqzAh6Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127eThw1191778
	for <linux-remoteproc@vger.kernel.org>; Mon, 2 Feb 2026 10:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=; b=Qw7sb/0rce9f7zDO
	FGabQ0LLUkYrNY40peWecMw+w/f2g5/DCzuA5XWznng5VSs6T4O4AHTPTkXy3mHk
	wE+3pj3HObw31vADOe1uHj7aZnB//UmmE2wFsul6aOE6sbTp/VwvTVLSvnps9a6x
	LO5hUJqnTh4nJjf5dnXpu751XNCWgX8EBP3jcW/XTkuE4QY08+bXsx3JZjIbPVSL
	oo3jk+4QLLKzGf6OoGzoBezuGguMrkYtwnIIwlBWspaZzf2wPO06NWWIs5NWPqcd
	UhTFCo85PNPp7CfTLn/D159CXtjbJbs5oSchpH/vHDcc6d5u8FnI1uydagZCzIXA
	83gJ0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4w1qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 02 Feb 2026 10:16:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so110695085a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Feb 2026 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027383; x=1770632183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=;
        b=NBqzAh6Z4QtLoaR1pdEtk0Ov915lLTV7Y1wVpE1b1PZ8v6zeK0NRHxBQqz5+XDieF/
         b7Y+234bUEajEGpc0JfuqdFn+XuaCFDlNiV2Bmq9khm7rxXwQoZrbpsSXOHDRTOQhYYT
         oUSxUT9ZvIlZIQz/WekBYYI1L87OSw/3byPWkmgCjxp6MivtWqqbgIZMqCsgBbEiYwMx
         q2sWbzVXHb7AoMUC/Ty2EMcZ4JfVRT3Kg1khkwssY7WsQJLM2GBsnYF95bh7h4r5M6lL
         cWn6B80aOVxjLwy9gyZylIbJCWaLIPoiyk4gRETxWVtIe6HZL5PUkXKQlrr0AndDh9/h
         Lj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027383; x=1770632183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0ynAAGMGXymsfhu1/mPnfieZ/fw+zwbgNsbpGrKCfc=;
        b=v95SvlTn8vp2QyS23LrLByik+P8luZR7o9SwzpEQQTX5+zgNHxPJQoKY60PW8/pLAe
         GJTNldLcAcuPkeGEtgaNsgQq1f21e17YJXkRdacFS8jfT4LY9s+pRv6fBcZywZ4Bz3qR
         WrnvRqJxoWp2NAMtokN+y+RokjIc/QN8681zbyVv0BFnrfOEWR+n+uOMXHXZxs6Xj0Ln
         OLKkv9xrIc/7e9XJR02oRE63n/M9gMTWqEC/KWc/kOUuXBP9yiXjbNc3/B2jTiPGPWCU
         Ph28L0Tbjx2Zi3KSL7FsZMFcgLjNRxeV562ilhegon6E9URURYwfVn0vjMRy0nzGalwo
         cNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUn0TIKHFGZaDrvl5b4YNb4ony05iPlubevwqpg40psNtceWokK1BH9BkuV1D7gtFw15t7JGJHj1JDqnmepwdT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Cfwtg4KEpFv0q/zsQj/sWDN2aAwRjAM+WAM9sITnaMlToaoG
	Yl7wdl3LWqnImq4HJFpyii5D5VySEnWTJS4gTdgCeu33aVS/CPZIJqIVvJFAuyLNcmYOomqerfP
	40pE2er5Mpbc+11dDaFPmi5I4zu1bvV75BA7E9WMDtStkPeCSR6kfN1DpSn8J+37JFO4LAck1
X-Gm-Gg: AZuq6aKILjKwVvIBQvtD/tYYi7s1g9zhiD+GpRcjYxCdMSAvLynFEGodVygBMEZYV1t
	3ZCRzI14DwmWBLOrWneP6/XhQmrDmgN4Ko9pmKUeXGiBCX0hwOQjF4lKcpV2UrhY7Gr4Ai8Zftk
	eiJm7KuoSwXeUsWxnrt1W/UbDqLddgDAjAxSBl7KeH2vk9WMnXOZSX9IaVlDB5Uhl4VCvnunp0Q
	TzElNdwXEnZP4DqxnhLGnH53+w/Yvl9Bs+g4uudTBNcK4WTqGstUC4AJWGq5fG+vuKaga5tGJ8z
	5wN3bkTQEJbzkTRzoSKAwD+yeX327uzQkF910eC6WaBSM2LoAxDsKVrb35KD304cHTssGLxb0Yv
	M8RgonNuGjxhJFwGZs2z4P+9iib69XEwL89l70iA5GlmmgrYGREjZ/jwhXGpSMs2Ozq0=
X-Received: by 2002:a05:620a:31a4:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c9eb25aa3amr1055641185a.1.1770027383627;
        Mon, 02 Feb 2026 02:16:23 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c9eb25aa3amr1055639285a.1.1770027383143;
        Mon, 02 Feb 2026 02:16:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46abea5sm7601946a12.31.2026.02.02.02.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:16:22 -0800 (PST)
Message-ID: <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:16:19 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2b4NMGPhEX71jfZ17kRvI64An55McfKN
X-Proofpoint-GUID: 2b4NMGPhEX71jfZ17kRvI64An55McfKN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX5UCjAlo5D9Sh
 4wqSsTN49R+EOLlnGV5QMG6FEmVUh8FmI1QKuYdcr0LQnj2oq3eDtcApYBdHm9ZqMYm5rcU8H+S
 Ie09ru/V9LbXmAL6MMM5IGFXENdAtwBJGASRXNRTSLwlKHUFWiJvstd2uw9nt6mYUWaIe9wqeIs
 +FgHtiQJOntNd+hauROPmz3fPUolZEgT0ynEw8zLsI0Q00Xdh2EzLfJy/9mnOFDLAlRG1M5p3QI
 ZmlZGVqbQIhEleje0kPg6/ylR1+MpVj/xXuUgexLF3ZWW1gXKKgbBA2dAlpJ9ug3PnteFa+Dvvx
 a1qkz3i6jRP9jYmOXg+gOJOkapb5CDS4kZGwCjkIKbUJwALwKgTzXPcIA8a/O1vATVgBoPDzeSg
 xZQ8zmwKYwIN7L6s1ouWG4rwJImejAn7vpzErfivHSJLk9eYLCvEHEdtIzlqJ0b/w3NpTfmJdj4
 Qhss9JJz24Y9b6MSXJQ==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69807978 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7qjKt6vscxvWZOHtmVAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085

On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>> Enable ADSP and CDSP on Glymur CRD board.
>>>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index 0899214465ac..0eed4faa8b07 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&remoteproc_adsp {
>>> +	firmware-name = "qcom/glymur/adsp.mbn",
>>> +			"qcom/glymur/adsp_dtb.mbn";
>>> +
>>> +	status = "okay";
>>> +};
>>> +
>>> +&remoteproc_cdsp {
>>> +	firmware-name = "qcom/glymur/cdsp.mbn",
>>> +			"qcom/glymur/cdsp_dtb.mbn";
>>> +
>>> +	status = "okay";
>>> +};
>>
>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> but the firmware in linux-firmware is (now) targeting IoT devices,
> should we use WoA-like names for firmware on Glymur CRD instead
> (qcadsp-something.mbn). It would match what was done for the SC8280XP
> CRD.

I think it's simply time to stop pretending the firmware is generic
(some fw simply isn't and some fw may come from different/incompatible
branchpoints) and include a board name in the path

Konrad
