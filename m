Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE951DFE22
	for <linux-remoteproc@vger.kernel.org>; Mon,  8 Dec 2025 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211589; cv=none; b=AErb4Tja+FnL/fri4IhQyMinlB7o/UHHKo/931gVtXl+JY5m/nygnA8FUR2uUIPphSdt1YWfWgwNR7IGQOekyDBiTrzczadq1zPcFbFQGLbEEmImKuR0qh0f1nh7R+Pkp5TvIyX8qHJnHSwHgqzsEu+aEYfE3PaJZDGfp/vSLkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211589; c=relaxed/simple;
	bh=4kP2/K5lTTzD5c1dfUscOl9B3nFR54A29c9lPCoqrmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=om5D1ty17RAmKhgzpyaXc6YXkjdDm78ZPJS6diSuUqUXw21hgLaxnapOhONGKSJD5g2mZmB+18X14GT9vYm4EC8kcpIMYQvIpoMhSKsfjFoGxFZ5eG0KfDJL+NSsfNJOsT0MKI+UxMwDgQnCOf1hK2T8ZQPATL7zSj+4l/gKH7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4FaYQ6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPBpbi4h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4FaYQ6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPBpbi4h"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88vVY64183853
	for <linux-remoteproc@vger.kernel.org>; Mon, 8 Dec 2025 16:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0jPCBlDjyAGHOYNhm4qqz3KwSpK2g+kV3CwXvtWt40=; b=Z4FaYQ6s9cH26VAe
	IdNsMvVHL2UGkdyfjgaRROsDKQqgEErjrGw8b7Vyu5dwyfvg5fSnuOuSERj+riND
	WkyDFel2arRlNzwuRGIKdXJk87UGs4HDmr6IcgwSDundcOIosM/0D31207HmZh08
	Ip3c3Tpu+lHn8734L1/enuQbhSXBqcRJGeGWp0lR9b2C1I0Jg2WhJpCvplQliYYk
	Nb6poajnBosed72iayww7YCXAd8vQXPPViifnrp2gl1Sl+JOsbyD6//co4koj6IJ
	Ixb5K3LU5CC10eayYWXLZ37tpuqBwagvAhLfZFCc5Bn5cbxsmf4o0/0v1+DbwRkP
	nW8MJw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awume9be5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 08 Dec 2025 16:33:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5df6e7acba0so229204137.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Dec 2025 08:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765211586; x=1765816386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0jPCBlDjyAGHOYNhm4qqz3KwSpK2g+kV3CwXvtWt40=;
        b=CPBpbi4h02TrjJ6QmamVto3FASF+B7qy3iXUFzUfj7OAvdCpokDjMi5guF6YIWtE7j
         kY4oKZz7Qm7YiNEBK91Mc21ti748bZsV9n+hAcWJa61BZqNtrIjzT72BgTbwATW8iKxZ
         QtYLJbtLZIgz9MplsT/oEsCGrQM6F6gN1GwU0m2bshk9Py72LQD29cL3Dj9i1L52F3mn
         dKAxcIGHmAjgzRtTcBZMPvgJiGmir0VUQtdGhJmuu9vWCV8T3Dy9c16luPIOEQAlKZjZ
         fA1eE2qbR/aePFxEEO6vlc3UkO4vsFhnnKKO0qI3PlwglsWqTWfifA07/d40n7xJIAXo
         8C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211586; x=1765816386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0jPCBlDjyAGHOYNhm4qqz3KwSpK2g+kV3CwXvtWt40=;
        b=Sl+c3hC/jDEQUEyQ6iWfg08tpCVAPVobiB+phaydgcP+QyvQS0iCP9znGMy55hGPau
         llZG69vY9mYj449bYvRE4EjZ10RZs5R4kYI5Hg7OBNE33DHAUm/BuTfghKRK3/LCkY2L
         Ws72fchQAh2Yxsk1aeackxy36ix5Pkm/PuylSUYk1d3BXtaC14cFP9tByJCiWqqqrLIf
         7ZB6NGJ/0dr26zRUqJudrovym+bGhtGrwVzgnjbb453HH2kMRF03sbBrDkaeCAPuJSDS
         lZi7D9dzID5aOefNA05m0v7yLIRseVzteTITlBTopTGEg5/y0Hz33977rpWIVYGNqDPM
         M13w==
X-Forwarded-Encrypted: i=1; AJvYcCVmMU7zTAt6YzfAVHmjPraPORFQwulLmiNSoLuXmJSb7pqwuqxgDyDstQV+PhiNmRw7jfv5MaYS7JEg/ehPUT01@vger.kernel.org
X-Gm-Message-State: AOJu0YyOcMYEyj2KH9R2wnb2GaSVEQc2BC17A9n1d5Y8wbRlRK/DK5Mz
	ZrRakMGrsuGgh9kjDiRvaz9PzWPm6a6/WyKu41UZZ/5591PG9euXUyj23uxi0XMuHLD3DJoNU1Z
	DqdT3tTTvh44YwhVPfbqp57ZX8jzjZmH2txHYKsmEZtc7m+nEJ19hVGnrtUSd59Se82lJ8z1k
X-Gm-Gg: ASbGncukSAcdIyizbnk/I+K4/hTW5k92q01UqO07D0DSIwpvZ585B0wRcqjYg2VB5yp
	8sID5kjJMG4Y9BpqxeMhKFnF/stz0oa7lxBngkgFZ7uPvQ1SdXF3yoAUnSnK8mojTN4/SME4NFY
	v6eAlL5KWjmLYyTC9kM8JtOjCKVrHRdJxT77vr+0Ph3MmXGaCcqpUc51S/W5olPGi/vl1UC/JkU
	h8/3Rqcro27ELh4TzOG0qnCjdWoHns/jtTu3HJj4qIWRoT7dBUYYsrKJzbCsGYQpEkU9oxVMaUm
	6LrYTNCe/51r+PYPGpOGiGFw6tRHEkKIkrdTPaFd1WiSau3M/irQqxqX9aCReHInwOaY0/8SdPc
	w1Oubkdpvx5kbxJ8gccBw+vK8MH2uzUMt+MBpY2INHR5TUZQkCu7kVBRml4oJ9KFuzg==
X-Received: by 2002:a05:6123:590:20b0:559:965e:f563 with SMTP id 71dfb90a1353d-55e8456e09dmr922452e0c.1.1765211585540;
        Mon, 08 Dec 2025 08:33:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6DtAX4O9dA9blwgNCdrieGjzAXE19KIk9bTjGIhWldGNpRwxj3DsIOBUbUO1qZ11wI5CioA==
X-Received: by 2002:a05:6123:590:20b0:559:965e:f563 with SMTP id 71dfb90a1353d-55e8456e09dmr922439e0c.1.1765211585091;
        Mon, 08 Dec 2025 08:33:05 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49a898bsm1146957666b.48.2025.12.08.08.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:33:03 -0800 (PST)
Message-ID: <d81e017e-e317-402d-a4bf-7ddfa033299e@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 17:33:00 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Re-add cx-supply
To: Luca Weiss <luca@lucaweiss.eu>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE0MCBTYWx0ZWRfX8pBDTtKMvt4C
 kO+pPGNl3xetKsmPB8B/Yw151sxsEQ7tv0L8j4Vw9kHBnHKIKQLG0Ed3qWP64lfKtzNoIDLLNdn
 1c8DX6fK1GsuNz2NxjQQ4P4Y5lwVWgE3eGeT4I20cdW79/VVIQRPOELigK2kEKRELlHAYtD2qyC
 dBCm1ppE6bIE9gbzluiwLqIdmNq8OaaQrE8g5f0edeTVEok7OqaYViRM+xxsiJRvb31PntAr5W2
 OuVtn8gZXfEx+Ic9T+d7k3YuIjy7oBCo0F/63gJORX1SNlLNQtrojEPSgt29VSmy/WUiIR/OJE/
 fxGT0Yxl2EO/Gxu2+1wd7zehWlB/DDIRQD2GCS6o4Rte/VsuQJQbe6TunApTeUNst9UGB3AwPlk
 xvIdIMn5IdvTTSIU93XnpdQ/p3LLwg==
X-Proofpoint-GUID: 0N-pC9GnN4DdPLUJ5N5VmBiVuKIYfURy
X-Proofpoint-ORIG-GUID: 0N-pC9GnN4DdPLUJ5N5VmBiVuKIYfURy
X-Authority-Analysis: v=2.4 cv=SvadKfO0 c=1 sm=1 tr=0 ts=6936fdc2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dlmhaOwlAAAA:8 a=2w06CcI7I7z3fbE2fRcA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080140

On 12/7/25 11:35 AM, Luca Weiss wrote:
> Some boards (e.g. sdm845-samsung-starqltechn) provide a cx-supply
> reference for the SLPI PAS.
> 
> The Linux driver unconditionally tries getting "cx" and "px" supplies,
> so it actually is used.
> 
> Fixes: 3d447dcdae53 ("dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain")
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's literally one board using this upstream, judging from that I'm
> not sure this is a misuse of cx-supply or what exactly. An alternative
> to this patch is of course removing the usage in
> sdm845-samsung-starqltechn, but as it stands right now the patch under
> "Fixes" introduces a dtbs_check warning.

FWIW that's likely a hack (because IIUC it needs to power up some
regulator for the sensor devices to work) but that's "fine"

I don't know if there's a better way to handle it though.. I think it's
a board design "issue", since the DSP has access to some GPIOs but it
seems like that wasn't utilized

I'm open to suggestions

+Dzmitry-the-starqltechn-submitter

Konrad
