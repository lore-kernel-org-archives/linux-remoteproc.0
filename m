Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817A436BCCE
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925900; cv=none; b=r/YGfWxYQKVaSqTi0na0uiwsrGwaxKUXHcKXlXKCK7/w5a9D/95CPLxHczeT3LPaHNMAvWTXWIezzBBxFMuHgucmNDLQDcVctGmpiey7O7TUsjwpyZB2VR5DjwD9XExagONXXalpfL9Q7OzKpHWtWwbSe3nW/o98tQXPyfCN03M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925900; c=relaxed/simple;
	bh=TzBD1eRJUOUHls05wbjMwVzCLnvY9bJPv/uqA/anx7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5Gi1oVEmH9bxozdZPUE65LnYlUaewtm/OQ4Mg3at36krB49xiUDmy5ZqKT3uU8dwu6PHj9bwa0FmqTX5R16QX8ncnYi6Q9mgqsgCIgfHJ8WFn2UUqy8dsEhRb/a3U2JnsSuVq8pOczpGJ8cGyrYYGpcvQAVXuCu7TIInIVU4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DltwqRYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bczh61pv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DltwqRYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bczh61pv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LvR01754846
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 09:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s1SK4xxHCghz73tk4AuBgNJLpt1PKV49tRriGiP5+AA=; b=DltwqRYRdIQcP/lF
	Pl5jCI1YCOekGMCbcSOdekrwtyDwnBuX4uAcwBzh3qU9UcM6V29B+zqG5PTc57y5
	s4CvMG0nevsWDZx16pRJuDiHQJSA69XrhZBCHytaVChM++j8FJzyyHJmWHJ/0Qsb
	sYN5/H58stYjTV8rgo1adtp9/IKfH4ffi/SCGGcZEEJBJiVXX1BbdkzSrS5cvAyD
	Bd1n3z9VzMllWPV0nn0cYUBCd/7umvZJ9pb2ufc6iJvDeZ/O6gVBufwg5hzK8/b4
	ThbanhdivJDVtMMp1uB7ToFfNahY7TBo5yCGiT2TwTVenZYlqs9VGpKTaLiVB5Fk
	ztjDsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81brps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 09:38:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad7e454f38so231387165ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 01:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771925897; x=1772530697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1SK4xxHCghz73tk4AuBgNJLpt1PKV49tRriGiP5+AA=;
        b=Bczh61pvkz49SztkjsmbCb7k4anKBL1KRMT+QN6x+P23fEWX01OKXnFf+x6Sfh8ZzS
         F9m/+8k0dvZIhEzhxY7l1jMElBFQPTFYZPR6cazizePfw6q6gPkYLR/kUnVKIdOcdI2y
         T8avamSUAm44JlwxmV2QTm8Y07RoSXNv+BCZ/D5ZlEH2Vx019lsLLyi7VUQl1bZ+mPDz
         eho9VA+TlVFbWeAsBXz/wJ5/+csZDhmYIzd9Is6f+URrof49Vt5UGcDOqV3L63stgnM5
         wFKxop0n3XAdzivOPeJOzeDMvvVc+098gGh+c0n7r1LkaOtmUbS0oSRlfRj0gRB2bXEH
         wvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925897; x=1772530697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1SK4xxHCghz73tk4AuBgNJLpt1PKV49tRriGiP5+AA=;
        b=hBXBnQvoNe1KK+YURGo6l4tExWUXi5aPvfPzTJSCYpJWu7IViErZ2Ofki9nz03wjkr
         DlX2eVvJP9vbdAHMq/gu09Vkx7Y2S9xx0WqNur07MwVmUEukmSajzJAUrM9R/bmLWnrB
         4g1VEDGwOT6SDLvhrGx0kS0RiE6jCi507Fl3s3Zz7IqF9AuyhhJmPJXbI09Ie21QMmwO
         z8nfLshDWWnpz5fK8ZHoiyD4L90RtjHRbE89vnJl4IBEJpGuufH3SAbMRUa349BFSRTz
         WtJQznV+WX4kcT3XW0dCf0XUjmacUOMdQWetXDGpHBxONJMv24FWMUjZO6gZkiwNBKjw
         pQwA==
X-Forwarded-Encrypted: i=1; AJvYcCUq6oyaD46CxIsoTvl+OydWYRNAzJE0/poafgUm+tcCexSbYAFS+kIZk7uOBAfraFaVkYQFvObU+Z96CR7lsmZm@vger.kernel.org
X-Gm-Message-State: AOJu0YyCQWvQLEcmL5jo3maMQBJLiQOx+aStnY+kquQj5wVVj01Mlqzt
	9qK55MXMwaCGZBpsctmnKjjihypdB/oFoxsDt8PhFXuSPg2ALAFr5C5U8gE/ChaosO5b3QYI5UR
	fL4w69p7q6KtWShhVocaNF+j/1gPuOwtOsnVuMOMn6xwVpZloS/T0K9vdfu5OSlgtl51MJEsr
X-Gm-Gg: ATEYQzxA4/wxPuHH+xwG9NtiNAIEx9ap04fbm/1wKY3WBVewipK0u4pZswkZCgeYx2S
	EbfANwfIOYDiFYPWoeBCARLGK8G0KcG4GsZqkJ1OSVtwbqohQiQLSSguV/t4tc57i9ZZMA5cUPg
	xNtiq0CEWwghOzFiFw50WQHAcT1mIcswaNTkbkJ19j0Yl/Emmq+fxWwkhO0p+C2esLAAqinX+T2
	O0TIKyPQX5BfW0adekcAHYtDfZWXhC8j6HZ6ullvccctLp8nADVjoI+MFMgv7hmx2WPbGiBS4KQ
	5jEfQo+XJwIdHF2rYSaBOErpNDublpli8uc7JN8pvopZa4pRIqGoHV0osqBJIgopS/xoMFbo3TY
	Q95OsEZOGfFHsngsG+fqUk6kvBg7OGcHj+P9/CeDWfmGoqzxREsQY
X-Received: by 2002:a17:903:248:b0:2ad:9edf:7fe4 with SMTP id d9443c01a7336-2ad9edf81a5mr19440215ad.48.1771925897356;
        Tue, 24 Feb 2026 01:38:17 -0800 (PST)
X-Received: by 2002:a17:903:248:b0:2ad:9edf:7fe4 with SMTP id d9443c01a7336-2ad9edf81a5mr19439945ad.48.1771925896872;
        Tue, 24 Feb 2026 01:38:16 -0800 (PST)
Received: from [192.168.0.111] ([49.207.195.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e19fsm104235835ad.59.2026.02.24.01.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 01:38:16 -0800 (PST)
Message-ID: <83decab4-a59d-434a-8ddf-2808d7081858@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 15:08:09 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
 <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
 <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
 <lqt5k6w3peqlgvgeagp2v3yqtvqpaihsbkvu2hwfzel4j2whnh@qafj2mnrt2dq>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <lqt5k6w3peqlgvgeagp2v3yqtvqpaihsbkvu2hwfzel4j2whnh@qafj2mnrt2dq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hZSZCk0IgWt3RJavzFXs7Y86n2nPBWyg
X-Proofpoint-ORIG-GUID: hZSZCk0IgWt3RJavzFXs7Y86n2nPBWyg
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d718a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FDuvZuZHjihTmU/CkdNO9w==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pNNgpXSRwlUzhS52UYoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MSBTYWx0ZWRfXxd9p0XEQXpHr
 /Y/gxUSK0CuJRt1r0KxPvwNYyKiq4Wxsxlt88MUenWtJQZ3UMnVMPArFfnSVTtBUOWD0CLOJN+v
 Li2eDKzwp2qNpUSnvFOeD9GmtFzsnp1nkLxtiUtVyw1wC0vFCnKMvgeLI89TW0NIkKkMhhi9TwR
 e4prQe/OZSmgqMXUxhURT4KYA/UuGFPN9ytT44AHsp2zonimMGFy11CigUhKNFSKrjHGn+xpyTC
 jIaSGf1sky6yfxTjZc5s3ZzAJHEO47WC8NBoZo3kfx9ta4aXXQG6Jz7DLR4Y1AjPzdezGUuPN/A
 H2MhcDwPXfK8aNApqi0OOybG3Oq1uNF7cSBtR2kXFMAG4zDO6anGDGPFw3H9u8aFMBLSiL3TWMR
 8X4ygpVuvi3aU0qI4eRB714hZAzZBxnHIUzNOZD9PuGSbqTwtvz089n+/JTiVwf84RnBVrfgWr0
 JG9jV+WsAszlDZfJ8PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240081


On 2/24/2026 12:00 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 11:48:00AM +0530, Sibi Sankar wrote:
>> On 2/23/2026 10:44 PM, Dmitry Baryshkov wrote:
>>> On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>>>> On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
>>>>>> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>>>>>>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>>>>>>>> Enable ADSP and CDSP on Glymur CRD board.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>     arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>>>>>>>     1 file changed, 14 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>>>> index 0899214465ac..0eed4faa8b07 100644
>>>>>>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>>>>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>>>>>>>             status = "okay";
>>>>>>>>>     };
>>>>>>>>>
>>>>>>>>> +&remoteproc_adsp {
>>>>>>>>> + firmware-name = "qcom/glymur/adsp.mbn",
>>>>>>>>> +                 "qcom/glymur/adsp_dtb.mbn";
>>>>>>>>> +
>>>>>>>>> + status = "okay";
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +&remoteproc_cdsp {
>>>>>>>>> + firmware-name = "qcom/glymur/cdsp.mbn",
>>>>>>>>> +                 "qcom/glymur/cdsp_dtb.mbn";
>>>>>>>>> +
>>>>>>>>> + status = "okay";
>>>>>>>>> +};
>>>>>>>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>>>>>>>
>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
>>>>>>> but the firmware in linux-firmware is (now) targeting IoT devices,
>>>>>>> should we use WoA-like names for firmware on Glymur CRD instead
>>>>>>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
>>>>>>> CRD.
>>>>>> I think it's simply time to stop pretending the firmware is generic
>>>>>> (some fw simply isn't and some fw may come from different/incompatible
>>>>>> branchpoints) and include a board name in the path
>>>>> Well... CDSP is usually generic, except for WP vs non-WP.
>>>> Hey Dmitry/Konrad,
>>>>
>>>> Thanks for taking time to review the series :)
>>>>
>>>> The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
>>>> functionality tested on Glymur WP CRD devices.  Given that the firmware
>>>> has already landed, can I continue to use the same name as the patch and
>>>> have a different name for other boards if something specific has to be
>>>> pushed
>>>> for IOT?
>>> Thank you for a prompt reaction, it took just 20 days. During that
>>> time we could have fixed WP firmware filenames, but... linux-firmware
>> Hey Dmitry,
>>
>> I'm really sorry that this happened this way :( but I was out
>> on vacation the past three weeks getting married. A quick
>> review comment on the firmware pull request for naming
>> change request would also sufficed in the interim. Also to address
>> some of your concerns there aren't any plans to push an iot
>> specific ADSP/CDSP firmware for Glymur reference devices.
> There are no plans to push or there are no plans to have it?

I've been told that the plan is to use the same firmware for IOT SKUs as 
well. Also in case they do update the firmware in the future, it would 
be tested for any regression against WP targets.

>> Also, this series already warrants a re-post so I can still
>> accommodate your naming requests with corresponding
>> updates to linux-firmware.
> Yes, but the linux-firmware has been released with these file names, so
> you can't just change them. You will have to provide
> backwards-compatibility links, which defeats the purpose.
>
>> -Sibi
>>
>>> got released just two days ago, so we can't fix that anymore. Now we
>>> don't have any other option than to use a non-standard name for IoT
>>> firmware when it comes later.
>>>
>>>> -Sibi
>>>>
