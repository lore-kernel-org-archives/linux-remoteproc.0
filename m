Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B013CD8BF
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643274; cv=none; b=Ft/FL/L5Pgf/glsmgWVIh98EPzYU9EFnHNZHPWpAs1zCnj/LREGL0liV8N3JH/m/VY293j8jVbya7sRPD485eapvqAqj8AmIOeo77tRlrpjjG66FSzU4MB3R9k0IL/X9eweBDHshzv+AF9JPAOG+zAf6QlrLiqIS0egMfqIFX94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643274; c=relaxed/simple;
	bh=vyxandif7e2Gp1fI07oRfATGNarPjCLDQXEIPwqMsj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLWRvIeiGAltaNoZwtIkqBFQi2Iv4+ACtwL9FIxP+zLUHbLZ7S+xCvLgf9nSOr3Jgl0ruBPh19rA59ka9Rs1qlQSOBABM8VNRP3pWyL7nH9iwPEQ5UKG3+eV40Cx67VOVjvFOHrPG1OQqpFhyyX22NwhlxZSvHjn+gZOrR3hYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY16voI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ff0XVv1k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY16voI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ff0XVv1k"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2QuYC606600
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 07:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LBVWgoEVbNT5Sr8Zx0TYZA21QAWuf428PE7XhlhKrEE=; b=DY16voI31GQlqpoc
	rwvFVORgU8wBYhbpGGcXOl4xJYbnE5McA7OBUZr1Sc9saBkwbku7J1DBuH9DuEHg
	R/YZHQr39cVLvwcJBXKQK65lXtkgSKwwZtqNGN84xG5lArPC/v3PPyM9ZE8tqveE
	CPwL7+2/iQ20sW7OTAHwDNsxkRQuHmXy0/Z+sl5OLplfHkFP0anChhmMLR5QXwpu
	UOn3UnV4hx5q/45eVfYgQtT8DjOKBDu/E6fcwsaxtkyaAqsGbB9LDJ+GMprisG0u
	XB7NHWgkeBb4cXC++1qD0Q57AsLAkXKfRB8XsgR2qmurmcLNsQj4UDlKbmtKa6T3
	VIsqbw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swy2see-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 07:34:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c8cb9f37eso33273466d6.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 00:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787643271; x=1788248071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBVWgoEVbNT5Sr8Zx0TYZA21QAWuf428PE7XhlhKrEE=;
        b=ff0XVv1kXlcRDpNmBSnnRUJQ/59WHCtABUcwKy2jxgv3uJWwwJmqDWrM+K3WSSpM1k
         GBoLWdFz/wSPHpDTXTIH65sNx9kMfy08WQX97a6stBsdxrB7u3ygfkN/1huH+MmwGLBX
         96RnnYwz97gMMXnqKJUj6sp0bxcuVosNAP2IrtA5smONshMJjCYcWfBxArYKpECuOcJq
         Qy3r6ew7opNWCdRScEOls1AHsXH/jNGCygcQ+jAlObIXs1jbzHReFxbUVGUmFqNNRSZf
         buj2EIkEpv9ffQ9vDkTx6dfJM4tzcy7RbJzvFFx0IjaQtgoute20gyS9FeTG+1xMa44p
         UP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643271; x=1788248071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LBVWgoEVbNT5Sr8Zx0TYZA21QAWuf428PE7XhlhKrEE=;
        b=bZH7eRZgRIeTSF2tQm2HQ3pVH9+jhw0d6lkmPHXXGd0/f2ZYYkQ1Wn3TMHlR7yfGd6
         lOpKwV+CB5mzoTjRXO6OGQnf71vY5U79jpCuHKAYB9fwxhMxCyBsaMTD8ZXK9lwHAPyI
         ExaKc2Lcz8hrzKSig3P+7XBu1eY48Q+rScegU3tpS+tgqM2iSImjrBopqDE7pDUStztX
         s9cGDS7PZweZcVgaG4L4oypV4hbvZMtAGEf2RvoJH3QN0HunOPoumC/oGDRiM2ZUdr1Q
         dHeJz2tpJXFzospwfkarOAlaFTP926FoH1rpR2hFeOoggQeviMXjTlkIXbFEXyMlLn5B
         6usw==
X-Forwarded-Encrypted: i=1; AHgh+RrDyZ1erdN9qirrsGjjSxBE8utLkVbq6o09fdqqfK5V7QDD33C414F+qTj351Ni6IUzyXAGRyD/eoW+A+j1lnIU@vger.kernel.org
X-Gm-Message-State: AFuF++nSsdvSxeO4ZOdbfHeclI83pNlMgI+PSG2oWLr7RAHA3tK5898L
	a8Gqmbq8txdrod2Wg2NRcM7wIngp3d260nbyoDV7fIC3mSYjpBCkGMDjmBitCfECs8b+1jRmmMG
	sK24wVwCst+9nIGRnt/zCo8lb6R2y3yzJSU3/M4WxD3DuU3oWqJY7+qbNLtuS3Bqi3EDmlhMW
X-Gm-Gg: AR+sD10BK6fN24ngfJ2B4S4U9WXa9p21v8QjFkRHebtwRJkQxAJAc/Di5H7qm7UKWtI
	8B/lFwtp0lcP6UoJ6oAFGODIrLdKWS+WRD+1BjP2gqfEh1lz7hXLBH+dky7cIjApD7t6t0ys/Pw
	aZfyubkxRuvw28VxFwtTllv0XBFeu3bSwtrTdBd0CcGHVmduyY4+t3/G+4JdNtLNZWnNVzvLABV
	ggjJAAUfUKIAFuaKmnFDxuCka1p+9gnA3TPLxN/UKbXghs0mK2LaumeH6XPZaLO0/tuyVhOjkSJ
	TZc+LFGGcfKaA1V+/fhwEEbVbG6nmRhk93/D2ucMwvEF72H8JwSS/wc9f1DtTJa7DUW28l3+fAR
	DsODovY5oN8ZH
X-Received: by 2002:ac8:7fd5:0:b0:52d:9637:554c with SMTP id d75a77b69052e-52e2f17ff37mr48128471cf.43.1787643271516;
        Tue, 25 Aug 2026 00:34:31 -0700 (PDT)
X-Received: by 2002:ac8:7fd5:0:b0:52d:9637:554c with SMTP id d75a77b69052e-52e2f17ff37mr48128051cf.43.1787643270949;
        Tue, 25 Aug 2026 00:34:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1790020366b.8.2026.08.25.00.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:34:29 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:34:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Message-ID: <zacwmavu3huggr5tb3f4pqxw6ca7hsxuaye7okqgoh5fnnf6zf@73yke2jd5eia>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2MyBTYWx0ZWRfX/5WMuac8+Sda
 9jSS+o2QGsM/ce3s9fTOimkT/XEWBCPuDDuBgJm3F9zl19iBMfg5clCPnrjuNvmi4RKXvlkyq0z
 LS6C4g59edh1MQmj6GdkqPZt4QSPR2n3dnqKX7FlVLTNvgu2XK/Y6QsYeVVmyilgvgOI5l25YfI
 CbxuGRqvbZ2oaaT5kCRmfjwQnN7QsfFlZpCWAf3aC4178BverfRfzuKWMSuurr6nl8yQ9EUTehe
 74wNaSmtI2GM58kG3ykT7CSiJ9rDAbqNIIIo4c2W9Cy9FV0CduqT3wkPqWXE9JzDEOOAX0v8oNp
 YCvHQMPc2aQjveK40jl0ype0wwQ6muqcVqZFVuBUUiXCrIsp3AvJFAT51h0yvH03yKU+KO1ROpz
 eNtfD2yGRi1Mb2Oy2hymqn0RjfV9NtGF9wVjewHkBjDmLdTtiQjHbYMSrguLy/dvfiOcgMcN5Dp
 KYdvDnvFGvMVS5XMSHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2MyBTYWx0ZWRfX503JwfpT3F6g
 Hr+x9c33nxQKW+OVEmYjJaBOfR/bdS9YayOIW7sfH9widua7XBrJocK6H54pKwHGWIvD6JsPNXz
 5Tv8XA6b25cqEvpacBcb/sh3K+1ojZE=
X-Proofpoint-ORIG-GUID: _nwmBpRWV2Jh29fGcuJ-pyipioRnEoTT
X-Proofpoint-GUID: _nwmBpRWV2Jh29fGcuJ-pyipioRnEoTT
X-Authority-Analysis: v=2.4 cv=QIlYgALL c=1 sm=1 tr=0 ts=6a8d4588 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250063

On 26-08-09 17:59:04, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

With Konrad's comment addressed, looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
