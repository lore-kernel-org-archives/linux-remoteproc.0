Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768154;
	b=0XQ8tZDeuEgIH0JjSCYti3SDuRsP+H+F+lIoBTOXzhVcaiDfwg5hNDiW23ENPP3E0lVh
	 nIwfuQntmSjL/jW6b9PER2mW3aG2jDudj+Zhx5/WAh9AVskTay7spJEFyT47hG2GOcLBg
	 8pzNi+BADuuUkSXcu4B/m7x6VOMYjvicdA1BaVAMhBUGkx+07QXcLSp/5ces+CAqBOrMr
	 C7zUn5ShTzXZ+8HtI4j47fe3jckb5AkiMqvPMDDw1iRbaik/7XkZV+SJ/kV/5SrE72Ofe
	 OzblhTr6SAdytDNuBfVv1QnNs+RcrbArmuM5fwqAQsmEr5QmRPxaLazOnQuAG6ru6oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kfo/uUXo4SYUGV47gqbTnTk6IQOHSsVCeoliGtXTC7U=;
	b=UYqXu9smzrVdEJCr0LquvrFjt1uk0pE02NgDwTSSwJVhWXDIo4JMahzFBVkjyBT1g3S4
	 spQVx5RxDU87xuJLqkHrpBWdTDA3ykLyba3HXZxo24TWs31jLV6i2jEsJuYzYW7G9YbgD
	 5v3mQA5Gw9tsoMmXmtOHqNqohPH0725G8Z0pLVRf6Y6OriEBAPpFdtImO5AdmTqXGm0NC
	 59EZQbyT5P6SCMjBQECZaI8tFE6pnUMbuCm2I5DDFnxI6ojQjcNaGn3oG5R8K/qVz1F75
	 sZFTESyQL4iKCU37m3ygZyzuE1E2dZ2m9bODFzLYQaoy8ixS7krxstvqFnz+dLtLr4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzCqiUJY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksMfgpAW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C3606A338
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 08:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10C3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzCqiUJY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksMfgpAW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GYpf1197400
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 08:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfo/uUXo4SYUGV47gqbTnTk6IQOHSsVCeoliGtXTC7U=; b=nzCqiUJYjFON2rh5
	iqFHUCasnBlJRSKmwiX/1eiLmAeuOli/h0IZVK9p1SyYCo0ea/88SyAkMH/X+Vrl
	+3M6CJMHpFj2+VZk1DTdDHmH06cpoFSZhPoB9GhcJscbvhv+c7m5+hrOauEKy2T+
	j6F6CwsMUoXh8WdIcZFtfZpdJgfirhVXylsAD0Pv2Scgy54j0BCiQKQvfpIV52NQ
	D9FoFFv7zknbkIRDB24K9O8d416lggs6lX54D3V33kpePSYo7tiOfhGxvmQskxYK
	g4Qj9e48lJKydAQQaiYBB96wo/jG4/nFKYUo9FkSSRWqJkWg8QgdPJaPWzUN6CYN
	pWxlyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k89r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 08:29:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55b9c41fc3cso21558861cf.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 00:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768152; x=1796372952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfo/uUXo4SYUGV47gqbTnTk6IQOHSsVCeoliGtXTC7U=;
        b=ksMfgpAWeII5qIVeO1J/MAtEHm0w7kQD+QWbSubZOiGI5GheuzPuU6bGvGYR2RJVqO
         0+ZbKF33nSAXWsSywLbsGasdNJIgJQ3r4kOBhsp9g95VYzTzgK13pOBWzPMJ4BdSat2U
         oIRp9XOcW7BnwbaRe7dxxA7Rz6XRth/yEaS8zSy5/L9gfrSeyhi10AB2Nl1xeeUsTXjO
         4sOGO5FuI2ecnNycnliVTRTJPeZFMnRQxJVvE0pl25pzoFIp/Wg/jKw+2Xx9Wy7A8I6k
         dJUciWo8i64vMq8WtnxUPN1lGdAZsjChsJdQLeKM/U0rOXqhj+Tv1o/j2VgUpXkNqFTE
         MHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768152; x=1796372952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfo/uUXo4SYUGV47gqbTnTk6IQOHSsVCeoliGtXTC7U=;
        b=TLc2v59p3P62ngOzl68y/o4tikElTZVZifNR4iFdk7cDimN1+9DuxkSjLXuRG105mf
         jE6I+7JsXu7dJcH3tYS8yYA3HJRRwslugb9SiJ+dX1tbxL2yL5Kk0ZeHl0qKGSuosxAm
         f+u++vc5AenRPkMKkxYMz+BxkCENFxIHdlkv8k/F/Wuw82DdXgAdZ38MdtPbZtmzHeNf
         DuE1DoWnOAf49mdQKwMsJLCrp3yjHfRFOgrGJpzzhXvfAw2tA0tHXRWTZxsNmdH1DVFq
         Tbb0+4MCCotwxmsvHMw6x1v4b+jgBfuQsXVh0v+eVo4aAAOYVOjd6gpWxvtltZ8cmZ4j
         Rwog==
X-Gm-Message-State: APuU4Z8GNypyPjg1FM+HhbNGsdJZ99Js+uLb7USFwz3pGdYhd5AqPiRj
	rhj0jw0nZvhrlnbV23Sx4bBQwfKNF6mSr5qGHnbBqQQIsf1z2bRAM55DAzpzRPzq7/VFFmAXMlz
	cGPBepBIFV37O2Ov3VyyVHpitLiD9WiOyNjqxKlsFYbFyOFmJc06wxLVDjL0Rr2PV4AE0YZPD
X-Gm-Gg: AZFdTZetqOLoG6rQj/XC+T+JeQ+vq4bUCkGV+++A/QYTWX5i+M6tHuBys5CpkV8g5dQ
	EiCfBvpmihLRLY4U23AdX7Zapmt/k4l2yAGx20FyWtHc3ZMYL6tsMM2U+y1mIVheejjG8k4l5dY
	JVvfR93WwTUy1thOJgJlcBeKcCEfe3SIyLHV/V+rGT9udHDDbIK2rRVcXjhfmlreH8HF8LCF0MJ
	7qeH1kVG+m5iUWYEJxOZSVlFgjJhwWjLpX/1TeTCHgIqIWmr4i3ctzaLW96OfqGa20TvrfnURkK
	dQZr20Q+sgfm5dPVbyJ1BGlhfxwx26azM8427NYwhQ7FcLHw6pYahmk1TfLj2gexijCkcPEDQFq
	uOF4sujEufooltVRzxagQCvlF37laf+BONm1W4gOEG7A3ubkGB/+vBnnVKWK76GRxMK+m2XI=
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr427147681cf.4.1795768152096;
        Fri, 27 Nov 2026 00:29:12 -0800 (PST)
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr427147471cf.4.1795768151700;
        Fri, 27 Nov 2026 00:29:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed51asm826246866b.76.2026.11.27.00.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:29:10 -0800 (PST)
Message-ID: <7d01d01c-ac17-4211-bd9c-7f8809512db9@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:29:08 +0100
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Put QMP handle on interconnect
 failure
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        konradybcio@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        djakov@kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20261127064956.1950950-1-gopikrishna.garmidi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127064956.1950950-1-gopikrishna.garmidi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfXzBX8ViblbN+P
 JKlZqLu9Uisq4B1vZ7JKRLGLFlqyE0b79QOODkp3Ne6sPVrIFyWiWVekMWYgJOqf9VcOM+R2ngH
 1lFS5n/m0zKLYfaKpmPY77ttBzgLuhu20z5X89zgt8T8cs1pwv1qlDV0MhAgPWNcVczoLsd6kAk
 VLf9jgyQFcscPBL62VwnPGEZBAOvmJAeGnMWrmUsUqVUyUGiFsegHAzGeqTzhjFRpSdnrF4zhAm
 Yi6bSg6N4kYPG13Haz2kxqjlcukri4P+6s309a6lfo69sY+5twECm4c4E/5hLhYtRdu5TzKTUfj
 t2R8M6GC0BZ7i52h91SnY4eWWpEWFw83HHobQG83OgnVqzilrYnHrM2HDXFmwNMGX6ua1tKENRw
 Y6SyMjKCa4yfQxTWjKdShCBBT2Z4hBXaYRCLaoChjKbTVqQLssf6p3EnohuzzZ3nspFbEneX8rX
 VRy84dbR/TPmIko5Rhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX6ifHw5WBTHrf
 +e05EKMsrM0Bs4JnPuqoF1moH4Vaf4s77I/nYKIu1vWrzhQYDe1wq3lgTJfi6EtWS2Ex1v/Pzps
 qbvUPIQQDPpOuBlVrZqYXqcDIJLtSP4=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b093f58 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CS0JNJqnihLjlYYSz3IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kcO03szRiLIvk9dfQ0L5V6N0u4FV85Ve
X-Proofpoint-ORIG-GUID: kcO03szRiLIvk9dfQ0L5V6N0u4FV85Ve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270033

On 11/27/26 7:49 AM, Gopikrishna Garmidi wrote:
> qcom_q6v5_init() takes a reference on the AOSS QMP device with
> qmp_get() and drops it on the load state error path, but not when
> devm_of_icc_get() fails afterwards. The callers don't call
> qcom_q6v5_deinit() when init fails, so the reference is leaked.
> 
> Since the interconnect provider may not be ready yet, -EPROBE_DEFER is a
> likely trigger and the reference is leaked on every deferred probe.
> 
> Drop the QMP reference before returning the error.
> 
> Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
