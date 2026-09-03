Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B28620DD51
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2026 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427195; cv=none; b=Auiye2+hQAGkHnTAUpYsivaILoUkZ+q5TKxxKUgo/TT3RXt/UpK1fctPXvqMVLl77NhVdY6HsZcoZG8CVhIZieFrOZIXghOQYJSpIULHDpRsv2Rhj7tEMYs5VY1ESOd5LLdIfWLvShuaC47yAHYhcogJ74FNW68kcoXFxHiRtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427195; c=relaxed/simple;
	bh=4dMNKcjwNAJVD8eJ1dCKkT2t5k2LSNFyce/zltu/jt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOlDLiF4mV7tV8On48GSmtiPpcDBQMBpnG+o7kfOffq+LA/98dWjU4w1S94+SOTIyoIFbexyLmfnT80gVQ25j/p45b8KXmy4gw8RKm4OYI+amsnAWHjcVk80S0Zz7fa0g9WUpCuXr4ndBMFiTjY9csC+V0X/NB66GRjENa2YvEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPZp4N6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8qd7Zts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPZp4N6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8qd7Zts"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392Mh63612717
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Sep 2026 09:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iHKDoa8Z/DIcsHPCK975kS74
	m2aQbfHxcRJjEXuiJgM=; b=OPZp4N6vd2A+AOF+1f1iPndJXGWoz/D0BQkFLLhn
	vDXvPZPjkkYy+cANcEeMKxiWZuee48HtIRkR9KJ208k+TWLfXIhivadMShLMSb32
	JruaJpDM0L7CZ4zNvbUvjSNHyANXOE10GBtPLUOYwGHAuIUO626+yiTEb5DnZNPO
	6V89rDvdIx4aExrxDkkhLZ9ivDOHf1rguSPnYsBpdPyfI7AfiO4GXWoiAsbSF8xf
	b7NsmP0pKscte3B1Bz93AMv3u5ck5uPwPLIr4Dc5+sP49KrBi1KoRMAHQr8aqvYz
	WBRrjNs6Kqn5Kvqxvocq3iiXeyL5310ZHUw2IwoPeNJ6Cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdr4et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 09:19:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso325355885a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427189; x=1789031989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHKDoa8Z/DIcsHPCK975kS74m2aQbfHxcRJjEXuiJgM=;
        b=Y8qd7ZtsicgBmlCNA/ymThZu5gf3Ds/SRF4Cv0Q3IGM7wvrzTW6q2GtUJ8QcTAaL2W
         6EbghxLJDytSY+JmVgZvlpYnG27XNoaNfogOMfpWRJEj8t4ruClBv/6TdyX2BJv3WseJ
         00M4dJJC1Z3JsTzB7VSqBmFHQ8kORGckntK1dYiulttkUIzEm8E2Cy5Bk2OaFD+wTGNu
         s3v7F819Pm6qrn0TePqaZt2jTGjBBGOnfXozu6uSVNnhK4FCTiujizCqplb0edMu+4yh
         NGI6EvgJnhvfTfZfmBe1umuuQ9bf0XIm0vgsRejINpnK1i3rBRTx+tOaC3sLUVuCsJeF
         MspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427189; x=1789031989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHKDoa8Z/DIcsHPCK975kS74m2aQbfHxcRJjEXuiJgM=;
        b=cn0CWiXpFk7pTtFaAroHba3mDdigpRe7/1AWEPjxWlpnZb8g5Gs7kY+O7TFZAgdZLv
         uw8hglFyy2uYA2wvdiCo56Fo9nw2p0ZF5M96VYNtYfsLjH1zJ5F9ROKADXEgcnXB9OfI
         gS4iYFUlHnGfwrotgQOSYJJylIXGOaol8VKaU7751TTkdpLuYMaeQWcujMZTN78l+V7s
         YaeFPUX7djBdk+45zS+iVkLlvEDaeiMumlYRJtgd2HYc+EQZrl8XbQ+9WtTsV3QIAiew
         4pXTW1KP1ltSbnwlyQgpscINMut5v9d3JlN7cQyzWdO1xHMyrvYpKnKin08kLBXPJwj0
         skew==
X-Forwarded-Encrypted: i=1; AKwUvBw3hnSf3O7xO60o3zzlC9ZR3r8A9Djh5K7hIGDodrOwD4LVRKJEuifFAnX18IprcOpvKYWhB6EM8lBtEqnH+rBv@vger.kernel.org
X-Gm-Message-State: AFuF++kIRAkkuv9EMIhDRAj/PzD7+lLXMuIBZvQJgI3+9PooQKg3W2Wv
	41NlYmmYVvZe55cNtyR+ltFWOtqCQGP0F6kimd8+N/9A2oHfv+ZG/3WVsvaG9bvdWnpE1w5a2rh
	4MvOsXmoUKHkmGAMo+xG7r9awyMC6CNXzFKgFQMWfHDR+KK9ps5UI/TLvCOPUX/cj3lY8nfHt
X-Gm-Gg: AYBFou14l7xwze7jssanchpaWl1RZdk95tJO847MJOBALjfTYhJicyrZ1bsKbNMg0UI
	3S3dw5oNZ6d3mz8II7T6MFwVVXSz/FDwi0PmjRMqMXWYUmu90+INSRzDifbkUA2PEz3Jz/ulyxQ
	YQ+2IJc7uDjMioNG9haN6+ue9rUFjsdRlXfBYZCEWLOdKs8WcecBcOl1HeOuZVLwkx0+ofyblOA
	B3/PixEOaMYohiyHrnInbd4hS4vXzSMkOOL4mpnV3bZ+nVCfbnEhhrg6DtCM0sMFpMZbzbOZm5R
	l++5Y6GeYSK6fTPlZSi9Hlr7euDs6sbfDgetqTVbH6sDGdzMMo/LWhM8UYV73OLassn1QjX5RX0
	JZ6P+QhTO7TmGXw==
X-Received: by 2002:a05:620a:19a4:b0:936:ca57:25da with SMTP id af79cd13be357-93960fb0a7emr1141584585a.37.1788427188924;
        Thu, 03 Sep 2026 02:19:48 -0700 (PDT)
X-Received: by 2002:a05:620a:19a4:b0:936:ca57:25da with SMTP id af79cd13be357-93960fb0a7emr1141580885a.37.1788427188279;
        Thu, 03 Sep 2026 02:19:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm12265237f8f.16.2026.09.03.02.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:19:47 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:19:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Message-ID: <3kulhbkdqqexdl2fflc7ci44mvfzjjpqhcorg7epdc2atlwee3@tj5mpzdsir44>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX/vSMRn7wRRTB
 HVlfiIXa3RbSk0jXE9yh8oLzfiz3teGGSc0+4B001bC8hCNCinkVeheGUg6o5AmpZWSEl12UFNT
 7v3WN3qgiZ6dem723jL/QfKMgkgKs3I=
X-Proofpoint-ORIG-GUID: vyuNGifzgJDBVPZmNPidApjO7ZuUS20O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXxik88jeXR1Hr
 BOqe6j7KSa1S34CSUAnZUPJyK15kMcEzdo3sVYTKsldAbke802TU6/4FCS1F7GZ6x1Wo5aVHwzM
 Ocd/mSYhdMwDUsMU3sG+m5nVrDJkndFnr4OsL0G6UBvcNhrQEmho7h+rxqDW7rLVw8CyUmJ7RC8
 9AehgUWhroUVQ6PCBYhB3x/bKdVMrvzdEoY/KRntvSZMRMZUO1NZnoDlUxiqQ2ft0MLU4fnKPFx
 lKyZSMDkNdroIoU+CVIK239qhuFkZb1k/w+Ykt6HoWTudT9O64l1TiFmEZdpAwRZvXFxvejFIb9
 k3JFVtfISlyJDPMj9N75er9u2BM8fVycoL4i0GsnF46310Abx2MiTAATiW9C0VFvKhRt7SdlxPu
 7GwDaPxHdqXTMdE9yisO+m6jeKMYSvXf9vjUezXkE6cG1eKwXZLoFO1EktVDjKgDJfoqoHCtNN8
 TckvAe/EsLIELg+Qg0w==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a993bb5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4mQfpWPmsH_nVP9DenEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vyuNGifzgJDBVPZmNPidApjO7ZuUS20O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 26-09-03 02:13:32, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and emit a warning on failure. Firmware
> load continues regardless a performance state failure is non-fatal
> but the warning provides a visible signal for debugging.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

With Dmitry's and Konrad's suggestion addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
