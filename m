Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0ED126F0A
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101495; cv=none; b=FHypZyO78NGkDnuR7e2Cb6TigYR6nzu7PX33BKGSoAvrnH49AgP/txH7EQ4g4xhU46XMBVmz5B1odJbpO8w31p81AfNiyOuD6u/e9oGentISQMPcicUrg71K1HEwCtbNranAqgTvYGP4S4zYAk4eKcKTiqLM4kPNL/SNu1PF8GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101495; c=relaxed/simple;
	bh=m9qCDpkjy5X2THY0acR9kltKP5HQGUMAZKo/7H5omio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bajdLIxkMuwWFNgMSvtheGe2JN3zD7bBPnpbuZl9HthH031p1DwxY6uoB9fNsNcZ+gA9eiLy53u0I+YhAN8yWHKok0K4k4HOrshZwFz8hrJ3j6ccSSCaC35AYh/8RKbFWoKPJmtMrpfPDSPe4KFZeA99xFjmNbuHOq+5NJjeya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqxwLbmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKX6fenh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqxwLbmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKX6fenh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCFr91212200
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pkr/1ETbWQejqwBM4qtLfTAa
	AxiiLLi9EmI3z7gEzag=; b=WqxwLbmWApf+MP0scmsGweu9kRuuQzlAxKa4xDS0
	me8bCEsYRkKs0UqWwp4R59vPcDuVB+sUvSjJYiktF0Pg+GoksF/Yb9wLMbKTsSy6
	eEvNwkXDKNb2s5O8Q9n7PJaB1PwXlA41ErXyFErlqYexgIloTKVfQBgaWmjJG5qY
	vZkjvoz4Gc9Hw2a0R2lMbYCxaWXF0jiwiNDghAdbIFS/l/57J33Cfq5PJC0QFLDz
	V83A0oMU9E0jnBSSPOM7pcI20Df55lyB4rTvvcc/Le0Q7hATER62nsGQGoDz1Ql6
	a6NqXFKxHRyQRVayozXJPrejWDjiCtYw3AzN/Slg69jV0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj5h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 00:11:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so1700950185a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101492; x=1773706292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=hKX6fenheOiLvBPZevhG9VID7p4DsmaLpZlIfdorXKat+r2czs4uFFCyDbc5iBcri7
         m2qmd7cnB/g5GytWPA0NCMLwUjgSEV1f7vvS6rT3YaCj8CvuxLVpODJCoH/D+BOXCqey
         1r7CxxPnek/GVzwh4PzROW9Sf3SwEmu+abu4OmbxAkDkU5FwLDd/HJ6s/t6cyKaF3uow
         d/4JvNLVBK9gJ1+eTS8PnDr8HuJYRBiUeKUAtNyBHKGFnzUJV4JW+6FuvpsAvO9YS3In
         +unmnhx8PkWH+xlxE8Lxfff06+qkbBB5iF1ApxoSFpg3nn2TlOovZbG07CyI8AwD1y9O
         hnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101492; x=1773706292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=SdqP3eEyhf6/FlwBJGcjiod4Sy+zGcWpmqN5gxtMBTLNBLjiBilQEFiIhzcoPE3+gq
         Jbfjjd4fcEbMMNznA76dSOx636+ZipOLdZXxz2ij2o6rcCdYSaT9+MbX61NrqQ0z+F4W
         XsKSpc6+31Uh6JAIPi5B2apnM7Wf2VmfDHErQlHZBQDicWDAxzH8G1z54+bSEN7fusMd
         e1fuAa1SvdArRYJkKCgriwLThVe87pePKZalbIEVIHH2VE3UtXqyihi2TQgdXJya+t3l
         vkwc9w38Lw7XMyo70aiJThVdKASmKNa+tf7nfLebI+YjiQFBzqV2Ebamv+YB5R4YCNug
         og2w==
X-Forwarded-Encrypted: i=1; AJvYcCX/HHN0FyhVBPm42KP1G/2PdPVsBY/sm8hFjTV2P5Zfz8WqEQwh1eJ2tXFvA45z14XD3NEtLQPRfg03O/oG644I@vger.kernel.org
X-Gm-Message-State: AOJu0YwRvXgS3KsOq3h7lHarrF4noegxXDBl3dI8RnYnMbJ+QggAKwx6
	3+vTxFu4D6dFTqGOCEwbfQOaoTBqEbldOmrJoj4Ha2fKCUNgcIs5JhOdzS4t9IGslhKLLKHso4N
	9neZeTATmNZ/N4AOOYpo8DhawPQlQeN1SIDdbMzAITDb/MlSG7wbbm0q+1B77Vn2J2Sg3X7k/
X-Gm-Gg: ATEYQzwf5CNFBADn1KijZaIvg3OXYLVd4x0JbLytQVkB5mVga3uFqjxZ9Mjq++0rqlJ
	mepxbjPcnimDeGzg4r8xGYwTs2qzcj6BmgIte8oGJyJOu7gob/oTlPFMA9dMv/7iCQExVVv3kk9
	+iaVDYHhPyl85ozQ6Ojrxj6R+QSiEv9wP3fEkzwqFXmo8nu2Gu0z7rvoNz+Fv3HREML6+PQkOw0
	twaVZK51EzqCNhbhs+0UFu4faCJ9fHyo3QtZspsBP+SPqpoPJzHFhWfJiJRZxln/BHleP1NwdRQ
	mh01z2H8hZsQBUXS+b9K5CTWTqbupyLyPrIYgjEa2aepLXcym9YmJsOGb0+B2wFEVT0Ny6v93mY
	BAHdLQexfEQBFzE0Hc5bUwF4Y+wiz74k+OMPsSNnnlIqWLrKW2+KLX07fDqUSxNrpgYNZYjmFEB
	Cv6t2/MoZC7zwLfFORbi6hLPu+f5z0p5UBXng=
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698513185a.20.1773101492206;
        Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698510485a.20.1773101491691;
        Mon, 09 Mar 2026 17:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfcb1d5sm1692581fa.16.2026.03.09.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:11:29 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Message-ID: <ce5hwbo75dr4e7tt27bcprhpch6fx47omhn22ni6v3uzwfb2f2@fa2bebk7foct>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af61b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pNJNIoqo8oUBudG6fy8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ZrYxvza5-BriV9f32TwlPdVQraTXJKoJ
X-Proofpoint-GUID: ZrYxvza5-BriV9f32TwlPdVQraTXJKoJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX9RHJRfvQwFBP
 FBLG9RJvaRDcQo2u15kC+FXJkdmLEjZSUrvGqE/6WOCr19UpYs7sIFO6GsCHZG+qq/929FtLtPX
 hPqCICJaxcna2AjrkxCHcMyANS1NEDIV0nGOpROYE+5Dhi/QZaYPMYlfLZuzhohJbrPoWs3vE/2
 22sBmUAbCdPDQqK1maJeHeCaeE9o5jQmVWeESVxxjWlsh4S2GHGJx0eJrF+pXUtwcK15vvLCtZr
 zoO/sFrg1TtIj0iNXCWdEw5mlMo4LubnT2ZTdFEq/g7Ecn+pHjOYe2mbUaK8OI4e9ftdPHMaQzd
 VKFQqJROUzLLOPYKLEMsjsfxCmNPfNghBuH2Y+XwHgmzMUxAlCvCIeusZ63ztP8FTulRo+N5ys/
 Rbd4r9kuI2lv3OTSNvSQgXyAhXmgiiVz4B8QLLAE/+A/xAinkuyzqccLnNzO8/tHTPbPtah+xZF
 61QyiS6yIoks0Pt8c4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211

On Tue, Mar 10, 2026 at 12:03:29AM +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> It makes more sense to unify their names and move the definitions in
> the QMI header file providing a consistent way to represent the
> supported protocols. Consequently the different drivers will use them
> instead of their own definition of the service id.

Also this looks like a first step towards providing qrtr service debugfs
in the kernel.

> 

-- 
With best wishes
Dmitry
