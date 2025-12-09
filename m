Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369262FF66A
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Dec 2025 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283628; cv=none; b=XhFwD9WUBVnLZRZFuf+zaEHayjZLtCWW3G6vHtFThdiCDSdG7vjY78bW1MLDYrwXNulN/dgsw946vE0n0WPOxw1brpxTbdbmx1RY+o8f2f6/C77blt6dVpRCvi7ixRdI/889sadcu95HsCc9xuH3+hHqjebkeIXhCnbCElHD5lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283628; c=relaxed/simple;
	bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tq2HgysD/ZXSiAVlns6t2fSDAwzKjBRq4urGxBU6/6awvxP+sivWdl1qub6nTMCYU626YtwWblNcrX/AAlLl2h2azZf9EwVhTFDRoDm7vj5B1+/vqJP/NYmt/y4JIG6PIOCwScCRwb05R7lTJh1AXEUcVvrlCH1vBH0u6laHP1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOk6Xvyc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOk6Xvyc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29558061c68so67466415ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 04:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765283626; x=1765888426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=;
        b=NOk6XvycS8ooT7O8Ljxmkny27ZOZaCFqKRJYkpab1JGjeGmorj2fN8wmicUSx5ukPM
         QNkQEV2nultxSc1kiuuRiuNR46QkNTkKBiEjkixpWgaisELQUaLEzR+izRDNKWxsuPmA
         /hP+8K41zEyEmAm7ma00AoVuCbFtBFWN8h8WKZ/64hd7oEnKLwJRd40d0YZfpQR4ibTv
         xh6Mdp1pMzEOuD0tJq/z8uVA2MybI5Sq4nQMoz/d2DxZsdqf2TcedtBhkTe4aidZ+y5m
         dqLwwAnmoNJvAeBBw8+ns8V9GY7+Igi5BXVWQGzEtmhoBKjbUkWNUbtFOcMSQgwHnQyF
         H+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283626; x=1765888426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVfvPAVJiKDUO/oAofy3yqLD+wUWwuI5iU1iNTYY+WI=;
        b=mub4l/B7dR7l5GRUfkDzv9OANAFiEQZ6zUXh9qtXZ34FdYLPqpPuPwzK1vqnE7mGGO
         sRfLV9Wm1vtSj6FAfAR95rec3mpFQ9ne2zBKmQH5X3mpYBnsiqU2lYi5N0dKC7Dyn5a0
         Z9vaTXIod84GarNuf1i85uAXl8A7eaKf3/AOOxR88Z1xqFb5+aW/evtWcBF2rnWWE/uh
         utpVWxgIQ+whNm19CUS0Hny6wS2Dn5apQ/TBCX6oyiDvBvKNvmjxoEtvqNiOd6QEIIG1
         sug08CHqSYeYf5wtvhxmhGoZCLhZF0RNRRs2a+wp4OkfrGpQePpzDBh9uIuA4srvQnJ6
         BvRw==
X-Forwarded-Encrypted: i=1; AJvYcCW1ecNr4Aj6atM5yUd8bFvGlAB9UpjdX+E7AT2ycQ1U/LdQLqCV/uw7QJpnlYFBvyRRHwWzJt485UgI7SXcgzGR@vger.kernel.org
X-Gm-Message-State: AOJu0YwtBmuL0covl4R+ReR3Rf+fdPC3P/jhZ+0Nzx6ZezkKMw6k0KvP
	cUPxkA2rCGPJrFYH44o2QGxe4o7Xm7pvMz0A4+rsv/zxF/IiqgALs1yK86fWpze4rOZ4LtkRqAJ
	9cqL/Slou8w3nc3kf8iXNPMETT2K86c1AIg==
X-Gm-Gg: ASbGncu66reH4CuyEcbgN0i/1e3hJNzubYZehkvwk14lMyXup6ybATYpSMMTSie8yj8
	Nh0h4QVIbINjiqoBgrJ4wbmozjWsS8ErjIBfmT5NjiXqdU71u69hUGsjQSbbbIsnborpbXmW4Xr
	UYSzjabGyrDLiPDV3/a4pYs/cA+oafUdnJWdSDgCjSeWl6LCgO0kIDZ2CZvgH0QMoG4zCwlRzYA
	mfo55Qjb5Y//rNgh2dy8gIe2H0+GVoKzoi+A0IeDruA+P3Op7Yn3mxHcjVtE0oBmzmI3QJcnfA+
	y7FT7uqNOTfPeNpkzSXvufCqFXOYVkjBVS+B0AY0V/ONsvfETohddlpsIoPnjRdq/+HgopvEd2k
	0KXDKvt5QIidpqeQcz3Z/
X-Google-Smtp-Source: AGHT+IG7a3swFOeoavHL3eVOxyU5R1CfS1RV/ynqUg2AU4818nOaE1Wsmd3U72SU9rWnp62z0sQPFfouzT4ajqcYuug=
X-Received: by 2002:a05:7023:b04:b0:11b:79f1:850 with SMTP id
 a92af1059eb24-11e0326a26cmr8705323c88.14.1765283626541; Tue, 09 Dec 2025
 04:33:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 14:36:15 +0200
X-Gm-Features: AQt7F2r__yxV-yD2aXnM4sB7qPP_1HD4VqjjT-S7yknrdE9jP-LkBjBwD7RtsF0
Message-ID: <CAEnQRZB5_WngP+U0nVdW0dnopUD5YDtZEU91StywvNTQdNSPNA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table" check
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 1:33=E2=80=AFAM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
>
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Good catch.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
