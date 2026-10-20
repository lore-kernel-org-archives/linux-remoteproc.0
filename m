Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491393;
	b=N+h1jMcg6GrOLMAw1Kz4MsPctNPQMbMG1HnM4zakD+IlRFZk+qy1QaSnrPzjQnIoUztr
	 ZKk3bdAnliE9TFDz6X7kB6iFUU+h/qeqRFjXD8awaFPUJ8sBZ5YhLGgCIYOO7qSFS518K
	 Lb6OA1tHbQIwal5KJHbGrT9L1iC/MYAKEcBMQsucQMkW3+bsBUkXxRr3IjS33aruERMBg
	 HRcAc972sUSI84zOVjozeiH8+qs0uLRO0BE0Zz0UiyNWGaevky3sCSvdy9FJ3IJDy6F2n
	 pVBZ6O3Ehbco/E83+UnAdAjXUH3eAu5Evz01ApiNIplT6wv79OxgeeqcaxTKdM9X5NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
	b=1HBfXzh9SvWojF+bjswoYrl/yWl8HNZPrvGKi8mbSbEkWlZFghQudT6MH8DAM7HmLW/7
	 2ey6gaNsIM33ZcCM2EMoSiV15yxEDUcxjgU3YfcmSVIFeHp/7HxHQKeJA0j/8KHjC49JH
	 1axOvFhrP1oi+wgo7R7+j3hBC2rwoNPWB+SL7NoRG6oUtRNr1wCedGLA9o5/2jGqEdmwq
	 +t3KWyYuZzeTo+Gs3+6xWnNxdA4WMKeOxn/TD2Pus7cy+W7Y42CF7OY/vBn9/NFvOSJHl
	 g17BlnuE8Xm62rzonD4865gwhou8svQ8KEVo7+UB0TXs/6Rw0oZLfsdpwsEzJj0vhkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7m5X7eB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpK7mf0+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DA960A260D
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5DA960A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7m5X7eB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpK7mf0+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Tfme620481
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=; b=M7m5X7eB1t4mV70V
	CVRgyiEhRWBi2+jzFZm0kcZfn/KilXnnSV9KfM3336T9YaCxrxPyQ2tb8UlR1cqp
	31hsVz6srU4q6y5GJ7+EYmmSSnTTvNjAw+rjw2FSYK0W68hDqRWTm7a1Zs4pga/n
	z9K2gA/ai3XnoCCgxVZc+0VkjjOd7IqB9n4687tBeQdjnkGqzwftNcUad1whN8xb
	Xit7Sw2/izjW3e8TwPpj/9zcUY4KGppNggJqh2rvEanB1Jz0POCIQY0HN5Op8KKt
	7g7z4yo1yiDPDqXQMydBrWcnjSKjhGtWwKIdKIFnJJTlVmYWrA/Vxf32Ih77EWc7
	Ik41SA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsxm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 10:16:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so74978985a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491391; x=1793096191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
        b=KpK7mf0+ln8S9o+AYHdf/5Qge1jvuO6z3SwLsGhapaHa64XplPWXiucO5/plflhG1O
         p6X1pcawiqve1c4k7TZP4Zc4T+gPcjhn0vUirBS2W0xyRUijcmLVWXo4hldOg2AuQABM
         0fJ1QGU09nh/sZVuQT9v6qDNLIHuu0GLWsvX/S7odYhkmwUnXoXHj0V31HAyg14T2VQ4
         WYsOwXP7rFeCKe4JImvCuTX9glDBtRICdUN/agUqtk4Hq87yZShX93NKkgOsL4sspaRO
         4H1cCC8LQU1rufQBUcAaYBik33fnFKur8/rwqtY8oQ6PdpjHb4EYi626aJJJ9zpDe+fJ
         RZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491391; x=1793096191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
        b=tUY2cDOKgEZakLftZrzst9ZVRv7bf9dkP689u3IGVt5I3wEAlVOqDAN/dUdhsBbjG9
         FlmDLXfkRtrDW3EV2LR5IPCobj4U3nTt/UDcpVUPImHghPNbOQxYEXEyVPqQgt5Xyq0B
         FahdlHZNHp0oRxJhsfAeirzd+UBaz15whj05hH2HsJAps6qz1we3yGmVnNG/SvFmUMYG
         u3gIKN6/ZzVzdlBU2PrbOhi8ziQE/dt4EjhvQmPETePzOwutfVDYOE3OxN6dvwDXbLI2
         vSRTQhJwHw+fcL/0KK14fSAH/Q3CClLTYgaA3SMh05eT97k1E6dIjqLs3DNz6ay6MrZe
         C0rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWVsELBQviE6AUv9nxKLrnWQi6m6y7IXuQkl2hetXLQl2nh1/S15Z+bQmcKegJMEIMFi0/6eAOa/LwY/zITwVV@vger.kernel.org
X-Gm-Message-State: AFq9FYIGw7l2ZuVR6gaWMQyXVCHGVb7MwRZU71f/HaIsFOdKh0DsrIeS
	jBe6kQE64feIkN0k0RbOwzDRRShcIzKKSFcJrc8jBbIUKSwZgjh5Wpjo4AwatKbWEWBT2NCIdGg
	rW5FMXMUeYGFQcT/ULJNYZW7FnmtUXnL/6KREUyF1VSJS+4eNj4m5FAx0RxeXyR+6sZZIPTuB
X-Gm-Gg: AYBFou1IumansUT4jWgmZNjGNfx9BtWm2A14YPkFRp35sNft3InJQy8fMsfqAPASKTm
	axPiq0x7d8+KM5to/vErpCFGFyML1Dv7ZbAvl5o2gBa9Or7VNuzSh1kbt8FrTTs9JPd3n5fcscL
	kQEUUzK6f07MsD+jtR5XlMD68stVnM/EHM5ufyUHXiVUOeRkek7y5vPvewqwXvSBlYt+X+l4+ox
	mtZnObph9TykQPct0u9/J+rrdQrVxBAKMYxO1Zv75XRTTal6WmEQUJuul+qeSFlkriEU8FmvYoy
	6aE+FU6+HS2elW6GgZsRzVQFFWd1FAdGUGsHxd38RFofNprebtJk/RTHMSlnaMc8PkLiyGbmc8w
	VLGGZZXgTh/+UtLc2KKTS6A==
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr1977419385a.2.1792491391019;
        Tue, 20 Oct 2026 03:16:31 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr1977416585a.2.1792491390567;
        Tue, 20 Oct 2026 03:16:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm468649366b.5.2026.10.20.03.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:16:29 -0700 (PDT)
Message-ID: <40a4cdde-6eee-4018-9358-2779a9fd7328@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:16:27 +0200
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
Subject: Re: [PATCH v3 3/7] pmdomain: qcom: rpmpd: Split SDM632 pm domains
 from MSM8953
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold
 <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-3-95c47d0f26cf@mainlining.org>
 <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfXxHu5zf48bZS5
 S0b+GG+QV05wjOun7S3jvTsxwwSowWOLzAObCf7Hqvm6Eqi28uPxI1y9WgNzu/f6gUpTxGwzY38
 6wkcpPyw6VCeB9MZBfVPXTAep72bWGs=
X-Proofpoint-GUID: JFiTRcI8Ud7NpSvsdkcjFJXsO-RyazzO
X-Proofpoint-ORIG-GUID: JFiTRcI8Ud7NpSvsdkcjFJXsO-RyazzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX+ntDOHNxzGdd
 7HBvNcHDALPuD7PaA+GqDW92xEiMWTJ+hUtOziUd7p8WiWFyTZl1QJh1EW/trwcNee+jvjwZoxG
 AjOqu7kTDf1JflPHaGbJgVaCU1Pn9D8N0IC0dNRsVRiYif433qSukq7xwEnx3TDEqQvthQf5J6G
 jtiy36dHotNTHH3m7KGStt0qQe1LmukLJiyRv/3xzJMcxzIJqJen254pMHuWNyoF5SWfzNlO2X3
 TUYd8j4bAdOuFHCKBJ+R3z7qi17nd8xSfBKz9eRyJv0l5a3VgGRaCHztB0dia+7YxO/u01eNkN/
 3urlKJn4LLHJAoS6FUGR9RpWfXopf6Vey0x2Vo1jsg/29QIZFbPMQN2sQCZWJ7qGcaOGpgRLXwj
 J0dhltbOOBinzIkyzWeVFO8HNPQXo4//b1kDV/m277f1UzW8Nq6Bj46lh8mIoA7EJZBkxVBOOiE
 RRcU6TuHFxoq60NJLzg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad73f7f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=7gWwhKplwqCMDIKiNsEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On 10/5/26 9:04 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 02, 2026 at 12:38:31AM +0200, Barnabás Czémán wrote:
>> Remove modem related pm domains from MSM8953 rpmpd because MSM8953 MSS
>> is using mss-supply as regulator.
>> Split SDM632 rpmpd from MSM8953 because SDM632 MSS is using mss-supply
>> as pm domain.
>>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  drivers/pmdomain/qcom/rpmpd.c | 29 ++++++++++++++++-------------
>>  1 file changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
>> index 5f55fc791131..c37a79d6bc43 100644
>> --- a/drivers/pmdomain/qcom/rpmpd.c
>> +++ b/drivers/pmdomain/qcom/rpmpd.c
>> @@ -503,19 +503,8 @@ static struct rpmpd md_s1a_corner_ao = {
>>  	.key = KEY_CORNER,
>>  };
>>  
>> -static struct rpmpd md_s1a_lvl_ao;
> 
> I'd rather see #define RPMPD_VDDMD_AO unless you have a good reason to
> drop it.

It's software anyway, and I don't think there's a need for
"keep the modem power domain oneline unless the cpu is
asleep"

Konrad
