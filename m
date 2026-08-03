Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7942FF657
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745028; cv=none; b=H+peTCiBuUxrumIA8GbVim8OGZAPOu0fW7ODkWFL7Nft46lImxy4jmnyba5Jhu5KWZHqvvHr0oujc7FJZ3KvJtyVpS43HVrwhHicsNNogIvvnZgOrJK6WoiBhkyN4C0bn1lGFlG5FX7h+1rD8Cyc6JNO2p0/fEmnZvGcah84MIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745028; c=relaxed/simple;
	bh=6LJZuhPlrub2aP1Ig2A6dK0jyt7w2dbLq5lbFJcvHTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpvpGLAskvn76mvpVqrsjUl6/Aaq8n5s9UIKusBwA8gzKe1DgOza/tJpIevHhYBAlWEJ0RQbH6gvcw19WlKm6vdj84ZYb+cl1s/49e/jgvxue/wKNljlSu+YL73Upp7BAWpbPr/iLUk2zQBNLmzXpjjVr81dBe3I5hM+KBmFJco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJcDwKdw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0FcGjKt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJcDwKdw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0FcGjKt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bC2x3956922
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 08:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFKIGmYsPA8uZZpEY0ww9lCJ/WnJy8wWEi9FkN/M5Cw=; b=UJcDwKdwYuJFPysd
	deC0C8G6h8PVJRGGvPDgDS64EdciqckNXmF5XpZRgbwFARiYcMHLfzlO4GACAj61
	qVsnu1cPcEZinTBiV7GLAaiaYESB6D8nKglV1TVvEYXrCaE78gpatWQuysqqFZb6
	q9WblG6vcnX4fV67p74f25BHOFQyPo7YoIFSXa5IJSdRMgbOh2sd2gTb1Kg8b2Z2
	9k7F9aYqyvPbzME8OcjO918twsrFhw8NUhZ2/ZzP/oLxovQLCS3oxFtPCIQjOaim
	l93zpFyMl9ujiQ1NyOcLJF3w2+i9IkfXmOHVA/+HI23Qv7Kn2YTnqKyyk3zYFz0N
	ofaJpg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngde9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 08:17:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2573532a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 01:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785745025; x=1786349825; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFKIGmYsPA8uZZpEY0ww9lCJ/WnJy8wWEi9FkN/M5Cw=;
        b=h0FcGjKtfNaFGlYV2m7/OK1RZr9SGHXsQimQDEKcTelcXeGjQlEdtesbTVLH5wlTIq
         6pD3+FxARwlJBeMm3TLoEnLYsFnm5c+f350PFi0IUvpMZtMN0FRVvyD+snnP8VCYaZDz
         3bU330mBQfFMo3LsgvNmvNKj0G2IBJVFz1zpReJRF4b68aurYGVtbzsp9Kpizak5rBRX
         cPc6Rj7d7ko4DkMf30jpMEP7BuKa46uEl/AAU4rOCy8ZagxqJ9h28A3+Uay2P3FsLztz
         y56Hv4z7ZKWyyVNzZWvIjmCRGZ2thdWgn7hvdJX5e8hr3Qh9HY4VHsDYQpMzZLg0ZjhX
         rWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785745025; x=1786349825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IFKIGmYsPA8uZZpEY0ww9lCJ/WnJy8wWEi9FkN/M5Cw=;
        b=phfDRUsVgVTnPKe7Vg2FnqrO4roXMuvXKeYvWuIIT51apI/ohYbmS/91db/azWoSJ6
         GMNu1rhN02u9oUqjhCOb6tEGrpTNfJMLBwmaZNjU0oYpeWeFdINO0Gqg4+dBrPwZJUTe
         2NFwjvwYKLg1QmASxa49wmDZ2hz35cvlacnAgv/wyJjrxkaUauK5mzWXla+4FjZM31TQ
         BbOQC3ARoJTCl7AJwOipEAT5SEpLuWHOwkQIh4kdKQA1imQU2Sv9HIRBjqkgS36mI136
         LMvYaYdXONtvsF9+zaEueXgawWenGTvRtMXN9M5hcHP81L1EtJN2VhS0alhmo82/5VFT
         Q3Eg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ijLoWulUuWBPB0Vj7/DxyGJCKcvg2ZjFj8fIawQUbvxQFpkZZWGUj6qPL78XVEXgjDSYvED4NKg4wUyOvzeS@vger.kernel.org
X-Gm-Message-State: AOJu0YzC6Av6PU8+VFgF1gJDcZq7dTNYra6iIuEEjQfavA4d3HIaXMs2
	tsWz3CImAKAXfx7txaiXm8Cj2Sf09TRwBZvZKBj9BvuWl7HvO4y8q9tTPxwvhVqfTQFW1X+/jdu
	tz0RmaWeCh/MxXugfQn+sZcWBnmVl+gyCgZ6wJmLWXVpL4LPQp5vQX0x8fNSRckEHo1bX/eSV
X-Gm-Gg: AR+sD107lWoKgGBjk7+nAkjhFc6utM54YUhTU6OF/WjyFACKRvEE/+f5PTnW2Ml7BVn
	FQKZDK2tdoWVsn62QWDSGTEbYDzVPe2J4jjIyy4dmnOb1K9M3aZlutW2zVEy/5IdBMhmstjhhfF
	E7Vm4wvPWGvRe+GsLvjepMd9D2bmBe9/JyXyKJENiX0dLR08y8AXQAfweLp9Ss3mWorGqr+CYXJ
	FwbH6I/Pdn6IV8G5ol7aF7m0rNB2D1pvSOUkdAHyv7b2TFc12cqKe093p1kCeLnWS6rZWP+RxzH
	QR3P6ARFWg6WuO0tXMnd7IVTXN6ETE3Ph1mezSW5We2aq4rtU+vTKKyrXyTHZkFm0p6qMzuuXAj
	jglxh7VMo7a0+I/fPDvB/O0xyGgY=
X-Received: by 2002:a05:6a20:430c:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3c92a5a1956mr8979640637.11.1785745024983;
        Mon, 03 Aug 2026 01:17:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:430c:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3c92a5a1956mr8979563637.11.1785745023263;
        Mon, 03 Aug 2026 01:17:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm51619256eec.3.2026.08.03.01.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 01:17:02 -0700 (PDT)
Date: Mon, 3 Aug 2026 13:46:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle
 and leak
Message-ID: <20260803081656.mh7vhh6fkfwru3wx@hu-mojha-hyd.qualcomm.com>
References: <20260701175724.1972-1-saileshnandanavanam@gmail.com>
 <CAF+TLO0wG0h9yo-tAqb3rJCiA5K1opj7rR3dDgJvm-hd49My0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF+TLO0wG0h9yo-tAqb3rJCiA5K1opj7rR3dDgJvm-hd49My0g@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a704e82 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NCuKpqI5_YNzGEkcyN4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: w5X6GCfMxQTdj4zZymzrZqlYIf1r5qtr
X-Proofpoint-ORIG-GUID: w5X6GCfMxQTdj4zZymzrZqlYIf1r5qtr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA3MiBTYWx0ZWRfX39EdVheLk/nW
 Pi1BMcPeeMcrSbDkMHmoC4cY6ys27VKZaDrP0b+g9aM6TC4a6mPfEOgzJCqUvx4RvieXjVn2IJO
 VPYkULVu0oC8NNvJXSkQJ2F8L8TziiEVsJ2CGG8xkk49K4X8hITxNXuDW6rSd/0XAFEBRdfwff4
 n+n9dkp0y3+bBNsI0pX9adtk95UkMZwsMshQrYIMnMmAsViEGR8sslvdanio3vFmA9g+JDwS1yX
 9uawHXbAVknvz+XFojwa5s3p9bh11rSzx3Ugg+ltMrZeNhuL6rjvU7P1i/aPuKgRcc/TcCbnoG2
 2DwQVV7TRrZjYrvAzXwdZboxhHZMezVLBQTZr9tl1pEN49ATciiQBHurA09K2RKZ8I5dJCGSD2z
 yeoNwf6PFvUX99GQUkrbn7px9vlGX4GaVrejxGnvDydi9qMqZLMxntTPJfUY8pm3za6UqnZsUAI
 29FVEV14q4dC41slenQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA3MiBTYWx0ZWRfX9Z9bVRGXao0B
 FnNBRP0NR++Gl3y+Po2gf5KOfrRCCQp/pGJnYgF4oJ786K7E2rPxycp2mjEIqvDfhPkQ3M7gNuT
 20N+FgevhFT9FyZK1Dx9uH6VMFve6vY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030072

On Sun, Aug 02, 2026 at 03:06:47PM +0530, Sailesh Nandanavanam wrote:
> Gentle ping on this v3 — it's been about a month with no review
> comments. Wanted to check if it's just queued behind other things, or
> if there's something about the approach.
> 
> Happy to rework anything.

This might have conflict on linux-next.

-Mukesh
