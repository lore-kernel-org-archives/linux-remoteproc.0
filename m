Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216125;
	b=DAGqfawodtWcd/+OnVxMGezJMeID9gY/8gHCDDT1aydtw6wO2u4BpJRp+U65Urkn/P5Z
	 pxrf0HkgjgWQwwpe2NVYi/kXKdGNhpIyxK4b0EZ8PxNx5GOXgK/eeK2/bIWJx/u8UldWE
	 KCDLcFW9m1Hxnpf7DhYCZDRVahsbhbBSBLz6oQBFiUKa492RPVLLuaCI5DPtEhakzDD3h
	 MGrLvHhtrJbKcseOFvoFWx4Oouws67wEX/c4rZlM+aqsUtpQVc9eSUSSlEyBmY5cV0wJ3
	 zHiMticV/FLgVjQ4qn+ehdxlxU5tUqwO6p1g34G6fkcOdcmhAr68hvb9xFCmLL+1hdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
	b=SkaGYLbbApNNy7V6miLQuAg9S2K07Jg6kqfB927Ji15kQGskV3pGNuWtwj5DhUgobyah
	 4TLTh7IEdS7BZ/FoaDlPEyXq1WU72xu4/3H/rCQOo8/SyiN82ka6aiDnvvDhY8lNl3TZp
	 demgRUk9+sP9Zy0rjq1e1zgoC9sNbvGG4QeyTdfUXB97RpQhnA9R9KG7emBTp7ajtv3BQ
	 kpkhgTcOwz0fA81YhoVx6VTgbFANTKuT7N4K3s5Do5UX20AynaeY8zvwpSzJ3jp6qCBLd
	 0CksqmPHw13Nsj1MrcDWULYg9y+N3DHc8ynatBn0XAXxutjQmzvssjG9Yzvk5AJdjvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyaJwg5o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/7FYHjD";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8F606A321
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 09:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF8F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyaJwg5o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/7FYHjD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969va63580920
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Nov 2026 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=; b=OyaJwg5o1UPg/G3/
	3tkg6J6KlESn9QfzWD/jMmwRJFxa24MSYhsK70Kj5Fmej71cp4O8lulJkw0gJqRq
	42m+dR85V2cv1JT5Dz4xESwFw04lE5ibI4eVZn8YY5FrpQjPRoW30tj4EbzSb2gN
	IaRUleqi0C80g5xjEXQyxuk0pbsvjT6oOSEHBMXpjiXaaHy2Fh90PY9Ds2k5WNQR
	yrM2HzEBsepiTCMYFefGT5c+9sJNGtjXUfHMpjjHsRfveXvaN+zpGp63ckOUlZzR
	eftriyugGnn3rEdTNr8nt+SJ0k2A0oY5SFRtzLWVgGIPJFDMe+xiRXQ2cNaaoFd/
	F41rxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735jx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 09:22:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso16256585a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216124; x=1794820924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
        b=Z/7FYHjDnUdXbv5V4BY3NSr73Uz3hdjIuhfVMqZyrSUQUJ1yx6fu3GKtgAPXDJdTi/
         mgSzn2LIgydf+/2+zHaWQFsFC8P1ReUz+8OS7u1/8+C5T+/oPfGXWyAtTjbZpfVLxXkb
         aPNe5SzP8y0aosy7AHBD0enSS5Lmy8pBpA1PlmRTyeCn0v8McL+B8nNhGzTU0LHSdLbT
         fVq79M8FBE++rn98yGz/yJfSAUE6fpVNFKHyu6aSE3p4G9xA4uHArRC4mzo2roF3VyIk
         0KclmdSoQeinmovJWJNC5KZjp4L0sPitXujRxdN+S+C/20MNSy0kOL8jhuUSemMBvOe2
         WD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216124; x=1794820924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
        b=mEWUwQlRUhCv+4NuMoteZ78fs0vVDTow8qPgFLpNutnzKb8kT/iPDSW9jqxh80hApJ
         GI1PQhwpoJ4nGXQmznsK/IxxVPZnU9v6WmHKeSCbzV+N2o30wKHFTyMjEUSVJrCb6T8D
         gwoASmBzBh5UCXe0LRaYT4kmPmXTdrw9z0d32TEjJIFG6Gadf0DescNOqcu3QAqKtI/W
         xKOc5MSGHmbuNrkdL8Hh3Wpi0Mg2jU0jHaxIPd70PpHOkd5Es4Y74dIe7Ds4uCgXoA2o
         7eYi3yK8a6IEeYBWWr3fj4zqgXbjDoBLOALoXLee9SQqq+tIzpy1FTiAQu8KIK8zde2k
         Gp7A==
X-Forwarded-Encrypted: i=1; AL+hErEZbwGp+OMab6rSgWg0QKJh1ybWDQyQNGR4JDEqujeOAdpvl6FkVuJFfr+2jRizPiys0IkHZ7lCQ2FTym0W/J5J@vger.kernel.org
X-Gm-Message-State: APuU4Z8EZSdNm7OGkYDGGbP6Q1gjHg5+FtgeRWB6TJluPZDj4DNKLYLT
	wZ7vJulQqqsHOBEbMGAw2Vc+TbV8yGOobKLwn6YhNpDqbcT7/6tiXfzbAY+FPYBjXEt/XSEluO8
	uqKSCAvBnUgpIUZhnfd0gwjEjm1sJcD+F3THQm6Ypz5FGv+SrYH/7jdppA6XO0+ScSwrHSH0V
X-Gm-Gg: AYBFou09Hv4B5DgVSSHYCaASXmHH11dqcbiY9bSCWhkMEZqeIyBcJPy/DEPZgR3XwdM
	DFMSw9cCFsu7GmLkXI0njNOiLcb90uPp2eF52e3nDEaGD8/il6oMywybApc6Fa+49UsksMHhHxB
	zGktULrnh80SAShEVJvqI+4iA72eu4EuUVQ1uv8sKpQ9kTi/KLaGkIexqClMIQ2aNlbEhKjcn1W
	yrNgw/ZrfFe5OoCWX2Qg+JZDjYIfcQQXQPpHd3mj0yuvtG0nWHfkY1EP/inZShQNsqSd00F8xfn
	kVnV/MnOZAtf3hyrsCW5H/KRJUCv44T0jDGjyyA3jcIYq19UmGVeypk+Rh9Y9F+bv2J5adtmmrH
	1XYE488MkdB1+1fR39xPwG7WJMgxD9S7qGLoYZzxUcqfT4K3cImpF8uQnPWyFKesEndoe4g==
X-Received: by 2002:a05:620a:2253:20b0:93e:571e:94f0 with SMTP id af79cd13be357-9478421a383mr520622185a.3.1794216123810;
        Mon, 09 Nov 2026 01:22:03 -0800 (PST)
X-Received: by 2002:a05:620a:2253:20b0:93e:571e:94f0 with SMTP id af79cd13be357-9478421a383mr520620885a.3.1794216123390;
        Mon, 09 Nov 2026 01:22:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ef33f1sm1191344a12.35.2026.11.09.01.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:22:02 -0800 (PST)
Message-ID: <3d4e74ca-5dcb-4370-a7e1-f4c1e2b3f9c8@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:22:01 +0100
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
Subject: Re: [PATCH] rpmsg: qcom_glink_rpm: convert to
 subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX9pbp6AC5zK9X
 +UDpIalrnlSgIPx31gZ61y3JSs9a6ib88dMyKX+Z8YmZqx2cQHiLvvze8W+BgOiK7IG13SxnsQ1
 B8WUhAP3XQPA8xkyBrSDGcYm6iM69NJWONwpYvmIbMBOTelJWRLeYGOtIhYsHiylxhNQGpT9art
 jwPZ1FmRf6SmVsSFTQNK3xhz/7aOUsatJTDmZfj2iVbhGOm9bsAeXObIyZknFytcncWcUy6V+w8
 Rs8ouoftCIS0K8jxT4acjYnOIi0lZJFbZDp0ZiH4JQdBeSh23a2MA4FBEVE3sfRlLzhloMV6ute
 nlXN0SYpq3AsCN19ST2n1XWD41zYtdU7fx/hZBCkR0Ubohv7hZ+XKrh4WWEiIChcqJWVfOI2qia
 VLaErwJgRxdx+Dax2aE+QFa3+IkMkQK1qTSap72JZE5EFIhpLom/zJQpiD/OBrjp3TpEtBrjA/b
 mBBmIZwAKQ49bUlCQng==
X-Proofpoint-ORIG-GUID: QNBc0H2nqRN-_dASp0hMKv9vttPgJXeS
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af190bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=2mfksfQnj69i5T-jYpIA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXzTfaKzbgBNHr
 zlWs7k+8ELlbeTKXaYA2B4XCds6ojQv5LSomDr8OxLqx1AMwzIDG2CSp0v7ekLY2Ag5ayEcNtgb
 eXGze+k/t7+/vB1nPz/wgWJg66D/iiE=
X-Proofpoint-GUID: QNBc0H2nqRN-_dASp0hMKv9vttPgJXeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 1:31 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
