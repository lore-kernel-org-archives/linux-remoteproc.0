Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829622C08D4
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857659; cv=none; b=akwr7NeeCID3tfBqlIuyoSJLJfcaYrXnp3jW9pu6Po06C1OMHnZkxg0xb95h7hxzIk93x5n5diiQ7FA2dEX7tIIuvoh2CslQ7DoLcW9iCN2gwHYAhBE009ZOPhO1p+Jv6ycem9hd9fBUSTzKu2USJKRH6gniQxztWMoGQ4wnpkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857659; c=relaxed/simple;
	bh=n4XlHGSeVV4u/xbLlWPIf9uljQMpisW4a0en2tZ2Heo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7OzyWuHSXZWDXWRwfTU8KI1spuUUb2TWZsUFTlv+86Cb2exbs0SwFhzXvWWYQl9bBhZ275jVr56FkFBIVbBIQpmSYxI3L7EXuiJmUrkdgFPyYv7BQDz1X8kLoWVmFtcVHG+h0XCugSjerZa+l8pgAUVpzN6o+XvaTzOisGnH4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5OH58iB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5OH58iB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UIjS024042
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nJJ4C4c1AFbf34ScS1nOa6Ac
	tdPWOXGtr4HiQq9bwqc=; b=R5OH58iBcrn9G871ea30573DuAaYzeeW6CpwHJtB
	8iWmxl0RNsJSom9nWbNnAGviY7GKRT0MyAPZACJkRZtwokhI3047U0Vx3tGXrn5X
	oo5OvjLmF6ABdb8Trf7Xgi4v1VBSTD/liJfoCzQOvaaO+NJGu9YmdsSF6FIXQfPh
	t6cqfxbf10MY72cTI0C24GbvNG7xPaRraeXS37cKezv2gyLg5RIPRGW6DfK8ttLG
	8iJ+SK034B7fMcCzO9EvzEOV20Lk+FSeades/CpmjJ+1q1fxspLO32I07GZPaZyf
	PckGKMZZroSnwWenGoq1M5plGvnrrgLfTAHZkDD/K8fqJw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agwfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 10:14:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d9f5bdf78so4034786d6.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 03:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755857656; x=1756462456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJJ4C4c1AFbf34ScS1nOa6ActdPWOXGtr4HiQq9bwqc=;
        b=iDUGe/3rBqFijjjnI0ihkVsz2zIPWB7INHljiOujScqI4+75SC8pa0EtdpRAUXuGs8
         Aeh+pZFh12cwavFYNH42hURIj8ARdN93wpP1sauddbU78dI5YupTnJ2ZH2gMKj2tz6xB
         iCIaL6ZzCd1K/qOJvQdr+r2ykC2KiI1R3DIg3/P5inLsgjMt6YDJXQR3XUD3OZWJT3cW
         xQKXFiqxgsuPDQUAGPTbMLX4QCZr5eEFP/K+oh/EvkzioIF2JSj6HDSyJ413rjJF0a2O
         Q+jhbzgIN/tHMYqu2riEUJ9o/++vkdQUiiQMrpgrIhoWa3kHVZKJd/Mo1cy/YAfUtpZu
         sfVg==
X-Forwarded-Encrypted: i=1; AJvYcCUBf1e/8rvd7QQn5ZATofDhJkzKxIJ83/iIzq0W74znZHtv7ZuvW8TgBeDGkJRGLfB2oGiKYFQ6e2S8L+BvSaKi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Li4fjoa5Z+zNEIoZovgRPcOPYu+m8wTSxaxiaWnRCFEW4c1J
	B1xrCM2Dn0xoDf/lUjtCClBPWqMVQpikfBdyyw55qAcHy1QK9XIscogJG+xkRqGgAc5idtHulna
	q2ayjRIWy6pzgMF/lIVOcu+27RY6QgxyOfeeyw4aV/rbcZHxoVIwbquP3CCut6gtz8FMfsTXo
X-Gm-Gg: ASbGncujECJQlmgkm/ceFaUn+h0o1bNa6CdufbiMBYhtk/Bqoh8TPmQotyAJvh06wgh
	OvEEVBngutf37LR8NojECCUZTPof5G5HZgsHUr9n9xDWCa8bQXtIfdy/FafqBsMX8KErNldQzzq
	xKP+ODYSrjC2Dhp5kGGT6p+OVT6J1eL05UkQGkA111mAxEVoJAoWebRyODom+VWwn3KQI7liN3h
	9fRp0aRldUSqrAhiqhazCgI1Z8eyGj3ziaJ/pmINgvuv9i5DNJ/WBYkugFT+8ZbZ+uO58U8BH8z
	pSpeR9SO2VPoFQxu6TtSDSLCXaxbiYsMmbkeK/mz6OBw+cschmeTeuNLL5l/p/Rn+oUkuDWy0fT
	j36RJOb5DDz46C/BkpJsYc5ndgpw3mJdDCsu+e0JuEXWJ5KrRJmW+
X-Received: by 2002:a05:6214:411c:b0:70d:8aef:8d0a with SMTP id 6a1803df08f44-70d9723d63dmr28732246d6.59.1755857656298;
        Fri, 22 Aug 2025 03:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvj+OJvL4U4ICh4U+njjBOvCBqdT8JPERhEDd9yPBFxhlUitzuVfVPcNlnrlKx+hna3vy4zQ==
X-Received: by 2002:a05:6214:411c:b0:70d:8aef:8d0a with SMTP id 6a1803df08f44-70d9723d63dmr28731856d6.59.1755857655703;
        Fri, 22 Aug 2025 03:14:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a604776sm35600511fa.47.2025.08.22.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:14:14 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:14:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rpmsg: glink_native: remove duplicate code for rpmsg
 device remove
Message-ID: <54moh5c4s4hssl47tabtlqm5mu33frf3x4k3fdhsrlc6abfltg@n6igz6vf5yd4>
References: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822100043.2604794-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822100043.2604794-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZG1ALcT47S1iOtWNZjNjwhkyQZYsrkAf
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a842f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iW8-pYDVSSCBICfSpsoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ZG1ALcT47S1iOtWNZjNjwhkyQZYsrkAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxd3/aceg+FFg
 /vZ+4q5/nAfs0Hw5filg4sa7I500XnjigHtCkXwHNwjTlnm3jsqvZMV3Vzp0HMrqPYJYWy2FFbw
 42DyqipkTIbSFm098xMqX7N3Qgs51bQJiHJSQRkwgfBXVo+0JyJrXisLIYvSSDI/kty8R2YZK3l
 qj96eVR/s3U5YYiZmfYdBIT7iAGV66NeTHPUQr7CSxZ4I3tqHJggTVHUwRsCJftA43avPY/cXc6
 ztSbOLyfLaB85GVwkiuciUwQz4osmhU+uUvY3scl9wMPMBz0gNiow1hkZ3al3bKn4A2rZHUzFus
 wVzLKacgmNac9JCoE72Ml+zkcnocyCLTKTqtdJZ2kKpjJle8AEHCjHepA04xtL+f68nLQGRtCso
 Yk5yMrDpwguS2Wm1fjCW/Zsdpn8Odg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 11:00:43AM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> rpmsg device remove code is duplicated in at-least 2-3 places, add a
> helper function to remove this duplicated code.

I think it's better to sqiash this into the previous patch. Otherwise
you are fixing the code that you've just added.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 43 ++++++++++++-------------------
>  1 file changed, 16 insertions(+), 27 deletions(-)
> 
-- 
With best wishes
Dmitry
