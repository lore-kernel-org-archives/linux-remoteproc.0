Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEF2335091
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Feb 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329774; cv=none; b=LrjPXMMpOrkKMrc+0mYKutZ/PYHfVlR7f3EtWlXHFbMaZyc4/C/NW+v+rf3qUWwWW0kayNId5QWKpsvnriBdIu4v7ra8H7ekoVPF6Q1PrerSEHQsWs301O3U5cWeIVRhyTSPeAV9HrLrIedZlVYiqYJBzWtqDVhqsY7HBW5NLUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329774; c=relaxed/simple;
	bh=n2bmmKQTZ2vobkDiAl5wpyNkx9wE5nybVP2IUAzL5Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdunJtnnAilY45b9aEvzajwoyR6ZqNvBuakz8LXBqui8/VrQ64xtNIc5DXvxUZ8yzIHCOj4cisZQFIwNbhRnM/7olDddm1kutnA/DakAvqT5uOrKvwZGF649Y+VJ9sqx20p89K5/DNDNWW/hcH8hv2Nabdr6jTAmPogEbfnDdJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUPYeLHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0yjOpQP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUPYeLHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0yjOpQP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAcsMA598036
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Feb 2026 12:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bGm8YJF4G7QYW/qaOMM2c8kP
	NYdqClawZJbczBsbutQ=; b=VUPYeLHHodmnO2Q94yDbR2HtKNHWLFoB0NS+M8S+
	xibBsrEe+RcZIv6wL+LVdqD8iVxRUdUF7mUdewT+EYw7Ruv75ieaVUArCEKdrGzY
	T1k5X9dtJ5hXJgt/82YWaT0Ll09Na3BIDX5DiKWmrRQciyrznTruuyJBL6svacbA
	6OaeJyfgnQERYTSIAWvkUeAU1h6wJRx6FpTdnv0+Wc1Xt2+qgfafad9s8DqE7u1m
	g26CVmTN3N69RejXypCIzayI/ALz9FmAwQRKNlNDybpM2qabcTTfadVmb5153B6j
	e+5AthgUFRJXTeLnKkXknzGoo1FKlXSoRNag06IemHFuQQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361q4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Feb 2026 12:02:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8950562d351so657862626d6.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Feb 2026 04:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329772; x=1771934572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGm8YJF4G7QYW/qaOMM2c8kPNYdqClawZJbczBsbutQ=;
        b=e0yjOpQP2Eu5+fNZSj6rG7+XQSS+POt6MLVnC7TyFMMWlwFBgwDRlZ/Tj5n3uuriMQ
         UDtRPp+GK6Yy2oOUq5BIkJt50YZ/EBiodhFM0u9qPlzeJ2CZcRUq3g8QDtGQvWAPoSb1
         5xMyfJrOG+OPZJ5/X19hjHJ9RivPEX0aHbM+qKWvMc5QxqxJk5VRiF2cie6RdoXhpeRE
         dnrraDy/9HyYq7iUMnR6Gt59uTBZV0roRiFH6Abstp7enHw59DJMr/ptpUF1y3jPQ4Z6
         DBmZnrysP/Agc3ZSG+tCdhZgu5bNUwEdm/S6xACngPl4vgJb6yMRr58afsxhyjktFE9j
         DFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329772; x=1771934572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGm8YJF4G7QYW/qaOMM2c8kPNYdqClawZJbczBsbutQ=;
        b=ee3FtWBNM+sBXmWrhJkG1uyRGKsKMV2dI09yOgUzkFqWeXI231Aypr0hbnr87xsouv
         X6zvyRkBHpose3RJjzftvrIngrtbLolmtoO3uhRtVH3MAWTWKnixc+JIY821dNvSGYpu
         6Aqb+vmrqEQumx3UvkupaXru73Is1d98mfvLjCfkxJ50nw7/6xKhq/UIeE/38vZJoR7C
         LYfQVYozW7JC98047Nq2w4foAUifxE2Eq/IIfz3famt5RQI2p5PZNgJV263fEZwMARGC
         eGXuqG7HC4vHMz+IQtRSPQhl0LaC7sk7GusVnRe/XXH8u5fsFqEcuczOTOeqwfBm8pUS
         kI6w==
X-Forwarded-Encrypted: i=1; AJvYcCXGLUqxWfMy/ZnrQaDYyAoIz8T0Zh1ELYBaal3myq2FwE25XI98r7xyhZ1IwsnVdqcDcSGXeO22S0DQDT31afT7@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTCYFOOo8llegRpQRh0V9ladCgQX17fog/6VE3Sr6nG6jWK1N
	yqfGIJIVHP6Fs2y9L37QM+xG/SiTHiR+kjM6j5vTrrDmblSclRSYzDnfY7EL5cEJNnrnGRhBq7e
	hDukZQTReHZ8Vo6ZpYxPA0VoyBPTX88p4nfz3babFBKKjoYsT9Dkhm689jXhcIkT7fyVXnRzg
X-Gm-Gg: AZuq6aJKA70y+RuFz8/yBBQvs2oewQgwon0zrBYJUwV57fqqtdT3JK3gjYWrWyCK0JB
	3q5emtrELL4s9812cQnvCYeour0mmCqHwJTGFFoHqexvnc0G4erMNgw85wTiAA5cAQAu45n5ng+
	ahctSVeufQjWVYUOpDRYa98jugQiujeksEg3Y14IK7yPq3VjVD/ZZ1zCUfhbYmg4xLkjEG23tze
	fWl77JIw/Mfr3mKPYQjkHJ+OqAH/vCt515e9VJMN2fWYXJ0Nw9/FeMqxmzDQTyWI4400c7ST9vn
	eIAzLJ+5RnCGqagqXCCDjs19VAkEkHmBSUzDetHE0PmiUqyMBOC6/rr6QlFCwMdNHgBlpIJWyTE
	B4fKSvlDAdaowduo8PJQuKGClLFppQYbxvZCG
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cb4d9b6f20mr1040223385a.10.1771329771882;
        Tue, 17 Feb 2026 04:02:51 -0800 (PST)
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cb4d9b6f20mr1040219285a.10.1771329771325;
        Tue, 17 Feb 2026 04:02:51 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac92sm33943836f8f.1.2026.02.17.04.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:02:50 -0800 (PST)
Date: Tue, 17 Feb 2026 14:02:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <v3fxfnuvkgxvvqmiejtemytw2uysbbqtdlmsn3yvojkep4jual@n737hvkaa434>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX5AKOMrni+JMr
 cJZ/nA2aNzMfDiZdfcUb/m8kwzi8u00PXcjiRwymiEtUcfRXxw0mQye40vppGdkpIKwPsSQW0Dw
 9ctWdtVBSyqawQ3YpQohzOFMU/j5ci0INUlFX9Pkjw6f8MV3GjBCj6PUxIhESiv8Qy8K8roxO0p
 YVRXY43s7yKBclObzNR9fcDjp7LGewAGPCWTmxfhuoAx+p4oX5MUzvNGg0AmPe8f7grYlJ9uv8y
 1D15gu5CTt+nafUyRuMgdG2tMqp4SnO29RAnodYgn6+xSWIAO9zWmcRHz9DP+s8ZPIETY6m3g+8
 VW0sYJ+sNPTls8eDJlyzoBtTLzhv3E8f/tuvMKKjhNjxcfDc6f250pg/rLg2S2GwOLwBxpMU7+r
 J+AGMC7q9OP9eBiTW5GdveHbFjKnuRJkPQmx+bvBoPK0Utth+mesiclwE2uy6fGKU+nrmFBA9Qy
 2eexfL2LjEoyloiLaHA==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=699458ed cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=IccHdx435YTdWfe-SmwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: GKfjdgnhk5XMBfYPkeF6ZupVWEIXjIJz
X-Proofpoint-ORIG-GUID: GKfjdgnhk5XMBfYPkeF6ZupVWEIXjIJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170099

On 26-01-29 05:43:58, Sibi Sankar wrote:
> Enable ADSP and CDSP on Glymur CRD board.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
