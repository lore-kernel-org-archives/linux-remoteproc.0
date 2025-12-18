Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A1277026
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 03:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766030092; cv=none; b=EWpDMu9Ly1W5zao8JntWpKh3tDKz6zGnmgXKzbAQ3OJengr3BwukokpycDO6o1l7EG3W1eXT4nrwEZ/VK1ZDjCtKQ4CqK8sgE918FmQCEzyU/yQz0AomEqY/MiB4TDQ+YizYD1/Oh8LYL2NMpsXlGMJM78KcFSJEzHTe7XpMdyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766030092; c=relaxed/simple;
	bh=+Ixh6mHhj1J7OoVqFw0KYGRBtx6vLQZ9oqZL1VqVLtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxUYZFxluS5BNmypLkLgktnzUrP8xowOjkxW1WOP+0krkGHlIcxmWirTRBv/Qc9rTDDXNhk1yJiZERigfOMDrODG+qzXl86WZNTFVdHgX+Ko9/te77iWeaxoBusjyG4fOAeUivqeh+a9DByWVYBZSpGmjlkHxkPilyrL0AVqLuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbi9vIlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB53Lx6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbi9vIlp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PB53Lx6M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YjDw167749
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 03:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Ixh6mHhj1J7OoVqFw0KYGRB
	tx6vLQZ9oqZL1VqVLtw=; b=lbi9vIlp73QWd6uD7cBQ2B8ewAZ5G3KxH4vDUOQG
	o6bSFIM0q1huXXWPDcWCEcbVRZpqgCYBaCm2XTqatbcStZYwkeAVQN2TRAPKA2Zf
	2QbmzHo93WHJjRuwBjhcawtw8DpRgzmRj0vy55QIrW6M4QzXmTc+q0BbQbz20NA6
	BKpGDe1YWtCMyuQ2HXDPFAE+155FDOriwF9X1ZduAGZIXwkWTvEUSa0gHGz+NP9Y
	PHe+yq89ng4m6DIWntcQ0WrCR85MzytJo1XRUwEgVabgBFgY8VavmQHCszPRiYW2
	CQf6Y62SLc8KKF1ZLvUVdEBufSNec+8ASyfa2R22yKU3TQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w50nth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 03:54:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b80de683efso450306b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 19:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766030089; x=1766634889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ixh6mHhj1J7OoVqFw0KYGRBtx6vLQZ9oqZL1VqVLtw=;
        b=PB53Lx6Mk9sKHhcopSOrAu3X9ByCbaXihpQpBfCpqtfp6EUbtucy+TahqzU8dXK3wU
         eZnIltyfeGRAOLnEVTqTd9S4pQCN0alXyb//fB2yF1J3RkkSoZ4gvAKi6BfLPvPAB1g9
         yv5fPODNr2BLhbWLtcbL0U6BBAoRthCn8bHEZB7fGKv208K+ZIZV16mHFLOLYGGZ/5Wu
         VWpM13u5kFybuFznP4PbANIZeH8uRl23ILNsMm3Ck34BEDIFVAWfoandjcr6FQ7N956X
         +Ue7U8XF9faSv+DbbkDrWXts8rNAHuNCRDqE1ysZGZubxieptYwSz2mvQYSnCst9qDIO
         8pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766030089; x=1766634889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ixh6mHhj1J7OoVqFw0KYGRBtx6vLQZ9oqZL1VqVLtw=;
        b=rbzJ87HmjOCMDNW4Mh5MRQlGy0WiZCpwq7Wg0wjC8bMLwfxsftTe7SrlzcMXSE2ysq
         3gM1JICY5PKXIyc1ZRHwBqI35kAqWCsQJu4ICws2lfgoG8tjujMAHu9y6yU7sHnpaFL+
         G5fPRh5Jf+3EffuKYoRrrOsVT31ejiEvoBx1HwS05HY00mp5UJ5NT68QVwTo20cEXoY6
         sWTASFzblk4hjYu7YA2+Bvgh4nyCgdzrE+9Sxsgy2iw6QvRY7wncqULySQW5ZnDZ+o5E
         iOq5Idgc4MX4iivtzkEpL7bmWgd2mgPf4nb5UOp0o+z2ZP7McBKBV5uY03ei/P7OlREx
         925w==
X-Forwarded-Encrypted: i=1; AJvYcCXi6XGvFFfSkmTzbxNYSpzgbltZ4cIj/5nr5m7kf/5ezd5eXkxUB5XQekSAutv3wPeSg04WIRRpFnkDUajOXVFG@vger.kernel.org
X-Gm-Message-State: AOJu0YxteabmNw5fUnEyd0tfC6zZtvsht3bxJ7OJwaDh7X2mc42pcaDy
	XSAi/CDw+Ul3HCLU1kZ7I6rVHMWt229oTyDjH8GeI8FgP7uemJvaZ9bbEDw0S898N+QPTnwE+U+
	KgZsbqmUuNO6Kl17Q9SSu2yw3yy7WRYhPug3LZGpQlc0fakNCiSGF9wVIvP8JtTaYNhLNhn7b
X-Gm-Gg: AY/fxX64iy4OntgavdS9kzPqImO+mMWIBxn0zWgBCk4nRyMEDsJqFztNDtgLyOrmaGd
	hEkgsphqUabTTVZMX7w0fcguX8gjaNOU4K2ad9s5mD7CNc6BjI/hY2weqt02VpXw1Qs3FoVFMwa
	wk3NhBmVU5iK23j0pA72GTS99CtZRoGC/jFfWHRv6R5w9Z4Q4jbCCRWziRKMrdd6YN2iqgZ+lRd
	5UKEEimjLbOCtcNMTb0U/O8BOtwrCllHOf2hkzokC8a9nwwlWXFQTqCIICTqq/35DFQCkcipMCh
	Mqa7E7/wBqTUwLRvd/Zy3TOdNarL/hHbnZ0ERA2yC69YwRsCc6jm1X8mv6FWCox4srjVMLJIYz9
	HeH++RE/tzZxrmYmqC+/goOXxsv3lvPIgsXd7GCzpBnNc7/lHXw3BSwHkWgzEfO6ov53MBRzpwz
	pdE2+GkQt74agl4sz6VILOjtOcGuiJwo4EokQnHjg=
X-Received: by 2002:a05:6a00:8f0b:b0:7e8:450c:61c5 with SMTP id d2e1a72fcca58-7f671a5d1cdmr20208945b3a.53.1766030089228;
        Wed, 17 Dec 2025 19:54:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfu0Z3RC/to5VX7uxyJoj5tA2aImIYyZUEcHPMbUfZKbpUXduHFabbKbu+cgv5q+CNrqcywQ==
X-Received: by 2002:a05:6a00:8f0b:b0:7e8:450c:61c5 with SMTP id d2e1a72fcca58-7f671a5d1cdmr20208915b3a.53.1766030088758;
        Wed, 17 Dec 2025 19:54:48 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe121290a6sm946895b3a.24.2025.12.17.19.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 19:54:48 -0800 (PST)
Date: Thu, 18 Dec 2025 09:24:41 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v7 0/8] Add new driver for WCSS secure PIL loading
Message-ID: <aUN7Aer/GG1d5Om9@hu-varada-blr.qualcomm.com>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
 <aUKC5EuWRzsyrHnz@hu-varada-blr.qualcomm.com>
 <DS7PR19MB88836ABB87B9858CB8EBCEFD9DABA@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB88836ABB87B9858CB8EBCEFD9DABA@DS7PR19MB8883.namprd19.prod.outlook.com>
X-Proofpoint-ORIG-GUID: bXQtob-1phk9jVy8QKWexsR-viPSm_7T
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=69437b09 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sgi0gA_3S5oNtm6GieEA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bXQtob-1phk9jVy8QKWexsR-viPSm_7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAzMCBTYWx0ZWRfX5FgP8bjOSRb+
 Vw9eXkL1xq0zK5WFq9AuHCoGQIPUWz8/WkchdOoXHrJASR+kLPzfpZ74V3ZVMYZtgTRPxlzQgtx
 /eTJ6Wsju21T1LzU6B0c2JEAgKruw5qKnHN8hIuDu3xVJA3lieDZybZfSGanvQqr/Qh8Iysz94I
 IjIoktbhU1+ADVDxCjN2hQohdxClYXlDYrAUXFQfbMv3xlR+jbBq4Vm45P6y0/y6e0lABAQPFEF
 tGA8OPZAnsWKPEhfgtGbLiswWbXIu6zUx9xim/sZiqrJ33Ab68q/1RepEFSy6KCdbAsS4shcFDr
 X7TnuZxol6KoeR8fEEzbbYR5t80p4k4dx1xAI2bSQbdikZWYRxmqc9oqVQt7q+CqSCiYb61+lnG
 sFxdvb4S2jWfqPZBLZklgNEEZes/yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180030

> On 12/17/25 14:16, Varadarajan Narayanan wrote:
> > Dmitry/George,
> >
> >> Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
> >> I've resumed Gokul's work as the last submission dates back April 2025.
> >
> > Thanks for following up on this.
> >
> >> This series depends on Sricharan's tmel-qmp mailbox driver series v4 [1].
> >
> > Since Sricharan's tmel-qmp driver is stuck, this patch series will not
> > get merged. Shall I drop the ipq5424 related patches and portions of
> > code in the driver and post a new version so that other SoCs are
> > unblocked. Please let me know.
>
> That would be helpful, yes, so wifi can be enabled on ipq5018, ipq5332,
> and ipq9574. Sricharan can always submit a patch down the line for
> adding ipq5254 support. Are you in a position to timely post a v8 or
> would you like me to drop ipq5424 support?

Will post it.

Thanks
Varada
