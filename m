Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C939C2E0;
	Wed,  9 Oct 2024 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728497206; cv=none; b=monhG4LFGycXYJxPaxrMW9xwvaXSqZ7+NlZYaSs0pCXKaWj7QLkQfeDmTNtOtq/I0OAtyv5kZasS+fSIHSRsHhv5flk1fkr+h3SpboXRTLppyjYJLALZITCnmBVDu1n0uWNtZBClSDkEpLKtsAnMdD1C0D0n742UeVlq31C/peU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728497206; c=relaxed/simple;
	bh=YC9P5SNk5GHVvZTnIjiEdFOLrCQZWFvzCDlLBFuc0fM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LJO7//Dtwwesjm6nZs1sKxJODEH4O5eGbAcofkVvaPRYPDyFBKZTViA67fP3l6e7T0lmQgkba17gnExh1G0uZ1dDXGzKVWIlhq8/LlNLmjuZX0wJOlaa7kvX76GBO9CCvZ8Zy+oOvg6HGWEldynAfJ9bxkQx70LR8+lxs5pEtsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Tmn2jzig; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Tmn2jzig"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 19EB642B27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728497204; bh=oQpofaH96yKry9fYKjw5SE///dq1Nt0vTXGTZgu9LKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tmn2jzigdE46bw6J0qKKFI+hQrsqCZW4BI5otj5Xbk4gpHB5YpOIv5Db2WhfGabQT
	 b5K1c39kEfH9FXGS0SqOBGjGTV3YIb9R0qFA0oMOJFQ6IOsliAop2i3r5q+e8Qu1ls
	 9Zjnedz/ZIQxyvYIyxmXURqcY1Mi20HQmwE7NB9HRxOF2XeLO8as/EkFUqV5U1MfFL
	 DnAjT2BNZm+8DanXMdF/U3HoUn0A/jLn7ygMvAHuIgWjq5opEMlH5PrCUpVU0Rktsm
	 PiphRLzRj5gsU5GK/YgF27WgUjrDb5Nfp6db1euiN63gcXrQuN5OPw+a3/Svijeb5G
	 0I4E/yGMm7L0Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 19EB642B27;
	Wed,  9 Oct 2024 18:06:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Everest K.C." <everestkc@everestkc.com.np>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, skhan@linuxfoundation.org,
 linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Fix spelling error in remoteproc.rst
In-Reply-To: <CAEO-vhFFHXeHH961e8KMYrwyUHtGCZmPOP9VC7QrhpabH2wP5A@mail.gmail.com>
References: <20241008071559.18523-1-everestkc@everestkc.com.np>
 <ZwanGrWs3PI4X7OZ@p14s>
 <CAEO-vhFFHXeHH961e8KMYrwyUHtGCZmPOP9VC7QrhpabH2wP5A@mail.gmail.com>
Date: Wed, 09 Oct 2024 12:06:43 -0600
Message-ID: <87v7y19mmk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Everest K.C." <everestkc@everestkc.com.np> writes:

> On Wed, Oct 9, 2024 at 9:54=E2=80=AFAM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
>>
>> Good morning,
>>
>> This is a case of old english vs. new english.  Using "implementors" is =
still
>> correct.  Moreover, there are 33 instances of the word "implementor" in =
the
>> kernel tree.  Unless there is an effor to change all occurences I will n=
ot move
>> forward with this patch.
> I can work on changing all 33 instances of the word "implementor".
> Should I create a patchset for it ?

Honestly, given that "implementor" is correct, this really doesn't seem
like it is worth the effort and churn.

jon
