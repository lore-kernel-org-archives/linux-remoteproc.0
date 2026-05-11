Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680D377563
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 05:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778477741; cv=none; b=noqYAHzOUvqsp5c8OAQ4X+mxs4TGjSJzMqnTOGy7SDGsK1UBPdoTdgotQcWVQuBa/DqBE7teN1+rbF5MqEiIJL+/MPa8jJ66zEKBQ1Cw2+WzyeyoYWCyMgqRTxikjAlC4KTWh4poaUG1Kcw1AsjEvoBR+ny8Qm2n6Qt4/1gRKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778477741; c=relaxed/simple;
	bh=jwzVGwaK8X12Fmx6Z2iPx6BVLyjWslbMA1jpIWzu2w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTi0vZHNnEqUjW0z/ZE7W3lpZAsZxOntiUCO4nnaKUFu4ahqsxeMrJNXab/drynRMszCzsXtkSWD6h3epbDA0CaxwZLOjc3oUWuAD+Kmkaf1Ys8S6lc3YomSCjPwsBgoZRbeJkoB9zi04TMwFnYlsuAaD4VjanqUO22CG5/prSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0ZFJr9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aH+O2Jjs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0ZFJr9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aH+O2Jjs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64AMQlGm3509047
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 05:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=; b=T0ZFJr9l3iq5llZT
	mqi9ljNX+R/bdMi8xgHgSYCJjwZqfQbSe7gGca1QoqgdxsCsU8dCvuEZcuAFVUDV
	ZoXxo6NlW1w4LOmRE+IS7jn0qLQMjau54rjA+F5Pd7UmYw0pY8hyIH6f3fPBScaX
	CT1fD5JM2tg96KW8LstmSQkozNvcuYVkqgB4VPX+tA4IrYvOnG4SX4A4zQyJDD9l
	N8Z5QUx8diQe3yx3uFcimLz+Q7G6NTpDDWjuxPhPMwVgDmuGt+eohOkSRQoVY4OR
	LGF7wNaviY+FLop2CuXJH5CeOyLCyyn7KgE7ezZcwrjqqpd818uyqoSuezKQ318i
	GDGOUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1t9q4xr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 05:35:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b458add85aso43191605ad.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 10 May 2026 22:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778477738; x=1779082538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=;
        b=aH+O2Jjs2LOpuOTGeoPB0H55JxKLLn4NXm5XHltNK1fQzvjLQTjyw6kwiNfpfyh9fq
         hHmqmsAqhTUHS20+RCyiBYnSOK5SEk9yS8GHHdQM6zr8kB/wW6cKq75gz/uQySFdFC2s
         AIHZfChr/j3iTKQrEcY9NemiK7qWaPdMqNi/745MXvbBL/39EH5sAKweQrwcEjBKyOO7
         g7Usnn0t8ajxoh9puN64PFxpNT+Ru22HXqnESwdpEnjV87fmozrUnxdvBd4zshzqF1yV
         yukSWwFC+rRNv7Hw0eZgmtAw84V489LEqfVCZNFSGArB4k4n96xkIyWjp+3iTOxdszk3
         7RCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778477739; x=1779082539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=;
        b=ZScg3R90I+WZ22X19VoHSfeNiPsKlrZ+7WFdzj10mc4dwYuyWHTOIbmHYRJTMmLS8A
         8dyg3GoTVeMhtQHCI8WSSznUmqCH98Vwel37oQnBc/4OSXYN5ul0aUJ3JNmjUMm/7Qcz
         xJcEZOUoWO4qVC8riumPDb91od55ckRpNB88+iU4jwNuUtSv5Y39YYTSNmKH+nUvlmYl
         2ZjWvfhUkN5DEP6KYAKAUZrE8A6m7YriNCeTAY6cTG2uXgIrTVuME8WkEl+pGzngpNeJ
         3BTGA/N8GY640h5HPYinWYy8xfGtDOZ1rpHI8IDotKz2CV9GpifJlCta3DXEY+mngTda
         gVLg==
X-Forwarded-Encrypted: i=1; AFNElJ++LCaj0WHrJN3Biby1qE2S6ACux+o39DnRMRLk8MhO5XhKr/0VA+kQJF+cG5oZodAXpIYUxHM13fSG7Wd+5Yn9@vger.kernel.org
X-Gm-Message-State: AOJu0YybRZuW/lIxMU0rkXk/Fys5xblGgq1FfmgRh5MYZG7WordBxAFh
	++EN/ZR2wBD5Ot1JHgwPgJMr2cHc+TVfOYTp6igA1NGUhbca2U85mK0XaRmdML0oxNBVtS3aUzy
	rzAIhV6/4r/IqEcgueeqGduFTl6U/y78HirgETK6ehzuawq1UzZ/AU/Ff98m/bWxyrP6zKmmT
X-Gm-Gg: Acq92OFzGFYHKXrI9nVNIjkBmdX1IUNcL0rDWxq6/d+MOx3uJzEcFUqrK9va6wWA6On
	7AD2HvUfGmAptvxPqyMlj3XWKTyv2OUh05CL616ZYtsQWV5wQS2SH1h86UypzllBk3YFvqyYUF3
	nO2LPeqtK5+onvzOV3R4dUjYYm8hWyByzq1oHkvYCe/Yna3DiPD/SWnny+BBUG7F5nqKxGB8QIu
	Zn+wsxYMiShAZj2M34FJSasv7J7EHSakG2FHbAR/XRzhfLfAhXQUIjTPEKIfz/hj8pouLfP6fBt
	Cdza/mi5rWoPWuRIS4VlGDA/Mo/5NsCHqh2+BYaNZwlZQ0j6J41uUoOidsYSL+ITL/4R8akxZP/
	gI0Yd0CUaqcPHi7KQsXmtWKcyfnIhV7SttEl4XL7rjcQFkdQ2vA==
X-Received: by 2002:a17:903:1a2c:b0:2b4:6470:760d with SMTP id d9443c01a7336-2ba78f473a2mr242876465ad.14.1778477738604;
        Sun, 10 May 2026 22:35:38 -0700 (PDT)
X-Received: by 2002:a17:903:1a2c:b0:2b4:6470:760d with SMTP id d9443c01a7336-2ba78f473a2mr242876025ad.14.1778477738092;
        Sun, 10 May 2026 22:35:38 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d271b7sm88946045ad.14.2026.05.10.22.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:35:37 -0700 (PDT)
Message-ID: <b66df3a8-bff7-40d2-b378-43235b79a8c3@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:05:31 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
 <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L5h35FXAgjthusk2yWpLlN5DVK29MgXH
X-Proofpoint-ORIG-GUID: L5h35FXAgjthusk2yWpLlN5DVK29MgXH
X-Authority-Analysis: v=2.4 cv=J7yaKgnS c=1 sm=1 tr=0 ts=6a016aab cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=f6HuTeiPA1jdPvv1JM8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA1NiBTYWx0ZWRfX2fTaqm5jETru
 owq68fdnv29V16G+ct07PEIcx9AmobVO8mjAcLwy3s+2s+KYNnBvuI3wwTRCv/5105MdlVN7UHt
 CT+9xf4WBc8VJkA8zEXbyekuxplBCKRogaptFT+jSQc6VRbwMroFYWUzzZtOPL/U4/N7LKsxTen
 7cvYycWyZSUYhhBgxRp4lQ3llxnhDXonM8LrtiCiqsXFISlpDdWGgfFIGLT67FZ0wHpG4I1OFqD
 JVB1/HPIYlVFY/Yob1rArDYKZtef20DEflZa0oijxQKrl7OlR+RdrOsUopXy126bA+h5CklNTs0
 YRCjYPuC1OHkp0z2KQ2SZD/vnjOGMAnsG9olrAm/gqLUDpvkLvUfwEBsy5Js05Go8HTyXv2bTo6
 vKgy75+VxuzFbZX63k95Lrke+bE3OE5Kd0BhDtuVrXewVb0EF3fXmnasbvzFmFnrDj91wvr7k3s
 FyUp8HPkJKSG9xmxijQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110056


On 08-May-26 3:27 PM, Dmitry Baryshkov wrote:
> On Fri, May 08, 2026 at 12:49:50PM +0530, Sneh Mankad wrote:
>> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
>> Enable Shikra APCS IPC support by adding the compatible.
>> It reuses apps_shared_apcs_data.
> With the DT bindings in place this patch is not required and useless.
Yes Dmitry, I realized that and had raised v3 without the driver side patch.

Thanks

Sneh

>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>>   	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>>   	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>>   	{}
>>   };
>>
>> -- 
>> 2.34.1
>>
