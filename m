Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500748;
	b=wwZ/y5GM3s+t9S4bOD4SQBASEEv7ZMUISGVQnGF8ftRU/sw0ueQTsx/xEDkNHgrrpdiL
	 AW7S2+l9CvzhWucrpCUDwtGESisiPRYha0icCrYskU7PrvGVY9HGcitqIML1nJyTiVRtd
	 RDzF60qITHpya4hzriD22tDKdi7Yp5LycAnNjexURmArxRN1BwQ0slKzsfkuehPjY3RSR
	 QnlQHXnwgZqtNiD1qq4OFKN8x7LMwDkdkL0f0cHTJiyWjfDZwvSqqw6M/G1V4q3D/7lW2
	 h3+aISDuBifUCfmGHMfDFjHrCw7VE2F7gOilmMmSnVkRc7NxCrH3xa5LI4Kwp6+p57Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
	b=PLNnFnYS2/bpk4PSE4vHIRiTY/OE2jTrZ93FWbGjw0tQnU7TM+99zhuEsDF19cZ3Ezkc
	 ECGWLbdszEv9sMGBPa57sTuMtPyTNGot8yxOUkMx//mPhWeaMD3irIa1tfTuEpGHof/Tj
	 xkmg3zJu/QXsdfxI22vtyWCOcs4rs3ZEMTUjc7pGkeKjSDkA4Zgq2qX/yElKQgGTG6xdA
	 m3tS5MrWnCKsr64Dnl3e9B2oJ5Tvmn/SHyMqk396XGaVI3wA1v0cjsOA26m8zuqeUGh4a
	 HxgmgiaaeRKmpnebVTqxL7G9xHszWY54tT1McEwT56WRm0YaVEVZ7RDp2v5LaiQ37cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUvMggwp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKvotkgg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A3606A31E
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUvMggwp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKvotkgg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx9442563259
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=; b=JUvMggwpxL3toZgH
	hutbs4SCJOrpTKJft8P68vKHx/tLNum5fkeLv26k2g6LlQNPIks0jXoou2PGtzXj
	FEn8IO/EqIVxK6mgqQHSvuwr37HqFEyzmm5RVdR2s0n+9QpIISgqI38Tw91G8MIC
	NeE/E6XEeN/T8bk6fYiwDJ3KPRRi96tkKqCFPpim1d1OB62AZclx4QbvKa5TqeQY
	DJVu77NwPGTVxKvRjGM71WjITDk47YQvxwj/Yt0564H6gk+Hg8g1dtgBiMECM4My
	un7NWuvVIkyeFkb6gMunwPXCEeS1OHqadnZlQNiNVZwr6pRdXKq8zZbdmxE+n7ka
	CDzlPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nag9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 12:52:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bebff9fcaso90084736d6.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Oct 2026 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500746; x=1793105546; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
        b=NKvotkggs/uunAeiSyukUFvAIPFkm7QjTKUiPq2/ujqpm9Q++FBmTYDWmM43BoYahy
         w3fq8mapMbmjQYBp26KjPg0XFYdjWLE/aIBEFfi2GszvLwRqZNl17Xuod9dJPFPp4MfL
         81QduXHIOJFXgbucnMr8HM5K+Vi7ZYhcp9QHd2QU8SGUMoy3wD2x757DIpXpnP4I3WzC
         ky8RGJBs9+MZk1IZ3Gh4Tdmc4cy6f2yNw3CWHLRJ0sbcFPfC92Xs/rhUednqjp6YRoGQ
         TZtO8IkrVxZgUFHvFlRxwby+bfP86uB28g/Nz1PrO/JHiTsXqkI875TH01QDJs5jW58R
         QQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500746; x=1793105546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
        b=EhQLIP5APIZ6UPsUYZPT1u4iW6mDIuTEQiPstBCmt1UTnPAjkuHcVaklgIc4t9dKmg
         aabQMUWTRTfl9SbQWCqzwy+djB3ATsel0p5M44pOR76OQU63PsX/68wDlhrN/txOdsNV
         4AJVryC03jpYkpo2QbUG3BMksDYT8Mz3gppRr/L8M1zh8QWvWWw8CAONDWQVzWifD6Zc
         fkHUrurZNunVKDrCwnqTrKOtKwOBPdcvvNI9lKQw1Tbs03xGqfWQJX6y59siBOlMdyMy
         FJ2CF+TUFuPFVih9TuZKrjSK6QzLYT4hwLKtGN2L4mPaC3vapTNjeoyHDvoXTfH11Yx/
         WVbw==
X-Forwarded-Encrypted: i=1; AKwUvBxNuCdinMw3P0vTqUE27Rvr5Yuzsv5amVwmO39t3fcivrNgIMGPkeo+pxCHovGsN5z5DmqeUoGxm0mjeNK4JPjb@vger.kernel.org
X-Gm-Message-State: AFq9FYJBHQZ3I5ginIcRdppgThL9Wt1Dlh7QWLgWtBYJPB7TlTSppYef
	0+hXCqA3HSOomlGAqfwprT/bg2hA2dBn4Z9qxh2BhNYGBUrozk3AS7OAMAQmn//MW02Fx9+bahI
	QOHxPvRKdxicbeAYNCQnOfhBUtY7DGkWScPlOLPpafFJN4deOyf5nQS/SxaeJp2zhd5uBGjmU
X-Gm-Gg: AYBFou11dkq1Y+UKhgrsS4vpQ3PGUlWN4YBR2/AW1hoSV7SzMxrZfSHJFPL/OSnRkUW
	knvHN656ktRQyA9ux+QGiPWTQtnxdPL3pIsS5E7D4KbfgK4G38So8S8R/ovT7oY/KTG2zoOO9vn
	qId3XvC9ulkAr4LxNyEQUhnkBNBwj//0mfTUvHKIdAtnTkEwJZ5AZ0Fu2xBMapt6kOCOwPxCuP+
	XDN0vg50k3AZyWEjSuVKkf7FSrTFW7rPXwwdlvxns06tMj7MZeKr8rbJwcnLgIYyk1gozRFk/Br
	46/ctnQyYhTedxpd1EkeApD4DZisFhlgc7pOV5wjCKZfQ5baDQo7s9E6EmryKW5wzQmUS5+AXY6
	m48FbmVmLxWYmdSau
X-Received: by 2002:a05:620a:2948:b0:93e:d364:c9ee with SMTP id af79cd13be357-93f29dd495bmr1630742885a.74.1792500745835;
        Tue, 20 Oct 2026 05:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93e:d364:c9ee with SMTP id af79cd13be357-93f29dd495bmr1630737985a.74.1792500745230;
        Tue, 20 Oct 2026 05:52:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9b3sm5714688f8f.20.2026.10.20.05.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:24 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
Message-ID: <isldc3mvcyqj3o6dzndztlobwft76zkph2lmlryki3qkpoxset@izxcyvx623vp>
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1l8dIYBew48PbsvkcBkbUp_ZVCYJQpV3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXxoA2Q9BBVGra
 YL2uPhk90CvGTpJiJGjAvmvCuTCWucZeZlshf1Ww7LU9IRC5GtNae+9CbSpKBZBXutZny22kn3a
 KilvqqMlx6NRZVLvIZj29A220c+aHfV7Q20tezkTfnUjhzmCPfMDjqERjL0okUnA3b+rcDKDKsN
 T3KdKPU/GHN3/ewiQM+SuyMVtvlHyLNDUgggQKv4agTnBXN1ePj256Xv0avFdsfCTDT1j9qTrWW
 OrjWuq+5+nL3zs6AWJhJunodMkdEFxuAMfwzHmEpbHj8ttdJX2hzZ4/Bm8JHDYW29zpa+e/En2R
 cEBMlhl4CikWfX2OkXZNo0CDf0RBXqh3pVr+mbjQz262OSsbArehee9yNxCYOcg+npvUnqgnT3F
 aIli3eaHmW0902UvVm4m5y31zawVbSIiGZ7Mo+Ap6vX3x9ifgzGf91e7b2a0jTjKzh8wmIGitTZ
 ERynZbmY4cM/BN+2iKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX0ObqxxCMxda0
 9Q6suPsQ1Sl4kwqfIczwqhPu+ieWeyEvHZOcaOF7P1N567fKGu0GJCJSbAXPvGl9RjwBMtfrRNP
 ZAlxJvkoI4ItdJzfzdE58E5cycfkQXQ=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad7640b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WKeXBwMsz3nlfjH64nsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 1l8dIYBew48PbsvkcBkbUp_ZVCYJQpV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-09-11 10:33:04, Dipa Ramesh Mantre wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in shikra.
> 
> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
> reach 115°C using the QMI TMD cooling device framework.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
