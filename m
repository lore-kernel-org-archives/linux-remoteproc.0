Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E7347DFA7
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629419; cv=pass; b=pICLGBdsdoDNYD+Y7wavGMWlK8XjG9+gnedbaBwu5+qGXZqHS127mA+gOkXaQygHY4z4qGjSWUVsPxXAafwxUBh8cvOx6p7bqQgR2ZJI6zQJNlJRZgkjAwHrTCX/GHifglD3zYCGlPuyquMjV9CqfElJUR8mwJMhhSwRdMcURec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629419; c=relaxed/simple;
	bh=dAg65rfGUktkEyRGS6LHi1HlhBVqv2aq5WVTQI9cBnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+9ZV3s5r84QLLBPaTrhDQdRJB14YtBYzWUACsexxebVMAi+4d4121mtSR22bzY3YWB28za5O+auE+e7ZX/XTeUaeXRdybo8LwyE4XvgoJYZpQo0HnbbX3dl5NlP9JYuk/mUV3G9ImV5EXEiZh0V3BHJinc2crKjvRs9XgMgtqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkZU9qx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kigqvJla; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkZU9qx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kigqvJla"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L7jqUc043427
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 10:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=; b=YkZU9qx6lnMX4N5K
	Do0b62EpRlotw+/e8mEbhWDllZ3QfTEvVcxyBwNAymMa+RQMcZQyFEuQy7fXxd9Z
	rWH4cWFfbPEGE74FlVO+pJA4iZDM+btPk9jltI5eWsv1UAL6mEo05qZHc0IR+y0z
	RJsUEtKoGNdiMaoLigiqBrxnJsAIW/jkcyEcEb2/Ff2hxrfXhIsfC3c5NR0SSa5G
	7y0HXEdC1VzjBR0o4gRORznyxuibrXiiQ2YD0U1oyc1mN4nSgSvfjlan7Iy2q5or
	tQ7kd/Y3Ni1XNudl9Rhgf4CDLVN9VCLP+AO3YviOI66wsozf3nEO/8J4yKJpE4ju
	0TPZmQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as22du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 10:23:37 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-667c40cd608so3884078d50.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 03:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784629417; cv=none;
        d=google.com; s=arc-20260327;
        b=gI6RjqQnzeafdBQaz4OmpdiYOxy2agAmWjdz9zHBw69ZyjzXvWlPrA2xGIFG1WjKtx
         xc+ObflXgP6x0FgnTIBqCrNmcl7Nr/lhOEevPyTRQohdhacM9YNdu2xa1xBTOZj5+v3s
         XgUUyouYtp/kcxeezL2KAbqSf5M3ok7VItynpczGp4cCLR5Jc5n4/g0vKIrcHzIUPMEZ
         fW/CTVYmf/54z9fUGDjtgGbRaQDSK040IGsdkVpijbde2QZjpstzZDdabu69ms1WQ1Iq
         K7ahWszwsVB3jhJv3cQCjhDNR9wA1/RjeInJvpV4j7Zbg5PvJcQLnKNNo0gCkYt/VLQS
         94hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        fh=yBWW2YjExNuADiEQSB5usxzpuhs1us5e1h/vP99SDVU=;
        b=ZTjEV8ph2abyTPM6jUYrKW4+W61wTzPby9T9OmHiLxX36w4eDJFL+k7r3jTQ1AtnEH
         mFD4YJS7iTAeeFaub1GyZFES1K0dxMhBa8wxoxCq+9f24bMLnjSQVoHS2O3OPm1ZXLWk
         mdFxXbrukIUC5j3FtYf4PABjur40tACCGGw25UKxAwROQmkQRp6AL5LvebiHfbYPkTNK
         duTs+HmNb+wjOvWgV721+bMqp3CQ93y4oX4gzxw64+B1uh/CatihqZzFmZc2JEGTn79n
         Vpn3IBMV3nvpOfo9OJNzBHgqQAOYmfm3sDGExi6DVK9IA4xbHuadgy2B5KHZWrSRoTWe
         /6uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629417; x=1785234217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=kigqvJla6RCV588Z1AzjfktddXSUFK1NyqCS1eIeKdP6209ZBH2POn3ja37g05Xa2t
         GtFplqHbqSmOHzxUDEAqxGEOj5SvNVocV7FOGuHdYYGQZLfAZjp87Cn8Oh9Kdw/AjU2x
         bZYqMzGGJZW72dSMqpHyBEVoeZQkY6ddP4HfXk5Iv/ruE0RB4J87GS9dScmvL+lqM1le
         5pZFeTPtlnTqQkGp+oTFy/zzDZP9fSNqFAEZyMREYN15hCNBlmPBorHa6QOqC4EPNC1K
         IchDZ/VkKKdvdOgG4bNmHJ3Gn9yHLpk1iGEci3cbdS6YCixP4ycecf0tBJ66orOdyw0N
         7RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629417; x=1785234217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=EMISx+x+sZsHtisICN2A1o5h73SZMUIdpPWZBEF4cjqkabp/kAXsK5tNpi0+7+mWF6
         BGZ3qCQ8hqipFSMhvj46hhLzW5aA2+6HJqgqh8rW+grz2EgwNQI+inlozTx2TvNyBsUx
         j5IwOWX4wDBDzSq0pWEoamDxSaA9W23MRlSe1mg1dI4FYPOJ9yjL85kiOtnL9ac9gSPM
         Ac0JzEkE9QBEg1PPx9gETHsAFx0q+K42BFrejx/vyi6wSfuMyhRrz1RMdEc78tKvrCXi
         4LL6ScI3d3m9sqe8BydzaDEg3NfStJQrrk4u1TovtMIzariwMXxikgMul/MFKcmFoD2k
         rFtA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8v5gL2GzOup6mkqbRR1X37TdnD4MIhp936/rh7mVNfBcfsDejviF2tUSpPHb/KZ0GjmxrjIn8zhXQZNlJF560@vger.kernel.org
X-Gm-Message-State: AOJu0YypPOM1PNwG/M2/F+1exto29kaHX6bF7F/LIJERfnta//L5VupE
	YFozUaRlEab+MW4BdwhxvG7f64F2kQ4JN20tnjmf3yc3kzUYYDfWAcQfla1PbL754fpbtkyC1Er
	NEs/N3/jvH9CUaF1CYW/dSGC3h/J9WvojSOTkkEuq9Lo1GZAyeEglyLCxPjq+dq1dAe3D+e5EG5
	DNlsu95FMUSii1yVzSvXAMA6gDiQ1LkY2jml5RtsrV9uzwGhA=
X-Gm-Gg: AR+sD11MunYNeW2G/N++sgFMy6FQ1/ixeGXrBzSMoZ/vPyQmFwQ8vMK0DljkbBGw8Nt
	jovBQUO+a2864GzE6OOcHmPUCOgXGK3Da7dQnUFAvi+Q3PxDX9kvcFZYySX5eU/dWSJUNzLmrU6
	NjpOFJTX1hu/kRai4jiKjt0HwDoCPQ9ZVXqQ18pFc0crsvzUD2zlVNS7rqFw==
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id 956f58d0204a3-66885e80a8fmr310964d50.38.1784629416536;
        Tue, 21 Jul 2026 03:23:36 -0700 (PDT)
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id
 956f58d0204a3-66885e80a8fmr310932d50.38.1784629416151; Tue, 21 Jul 2026
 03:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur>
In-Reply-To: <alJpc3nFX9D7_8i1@baldur>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:53:25 +0530
X-Gm-Features: AUfX_my8FmFS_RPsD9P_wAO_xi3w3rSS9J18xqmBVD6VnuXnMyKuUdz39cXSwBQ
Message-ID: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
To: bod@kernel.org, mchehab@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX92sQFP2349uK
 ++mWsmTtl4/EJw4jsnjgqSvLZnyVO0l2hz9/PsKH4pQTOKiJwAt3fylRpeEXzeE61VSELKjRQg7
 keXhzznQN6WwdSX5H3cq1BduPYVZ3KRdxuVJIzpjg6twe/PwebbtEm+7Hw+uANxKr4Tc0LfGU4M
 ReKEdQZ6OKjleOAuJiTomjMHX9Nf3+W+g05yWjkzSmSP8fiLTUQupE1qC4MzWdUhl8y/E9cBhFZ
 kGJ2dcW0yBlAjEa/JgTwhKRlbeoPjmkQ+fQ1QuE4qCkKFPaI2bIcTI/u8XyCKBACIOKA2n+rql2
 7uX2WlVufHE0OzkqDsG+FDyAMFgopNutpCx9jOsBkghmCSx7KJRF95yC3clNPlSjFdyqaJsOfwV
 Pj4XITSyTZIPwSCAntq5La6yZZE2Hv2ce7ugASLhw/LHSznIUNrbqEE6YS1QIWssnsN2dVvD2zi
 rUJzhf2uZsmg06hSZrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX3mx7ekF3X1gt
 PM3+bY9izlat6jIg8lRERDoYRJYbGRG46uqMgbBuJNnjsVik4lvjINvWgCeNHCXxz9+2USRNYKq
 qhLbCakBzkZ3AptAfS7y38MiHj1REXE=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f48a9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lt5aTsHmsBbDyw7JONsA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: y07uT87xDtCgaaFdZm1EVG32JkYhWyIV
X-Proofpoint-ORIG-GUID: y07uT87xDtCgaaFdZm1EVG32JkYhWyIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210110

Hi Bryan, Mauro,

On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > Switch qcom media client drivers over to generic PAS TZ APIs. Generic P=
AS
> > TZ service allows to support multiple TZ implementation backends like Q=
TEE
> > based SCM PAS service, OP-TEE based PAS service and any further future =
TZ
> > backend service.
> >
>
> Please find an immutable branch with the dependencies for this patch at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702=
115835.167602-2-sumit.garg@kernel.org
>
> Alternatively, if you think there will be no conflicting patches in the
> time leading up to next merge window provide an Ack and I can pick this
> through the qcom tree.

Just a gentle reminder for this patch to be picked up as only the Qcom
media client is left in the next branch for migration to the generic
PAS layer.

If there aren't any conflicts then please allow Bjorn to pick this
patch since the cleanup patch dropping the old SCM APIs is blocked on
this.

-Sumit

>
> Thanks,
> Bjorn
>
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
