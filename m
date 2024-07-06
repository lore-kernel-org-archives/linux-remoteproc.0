Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56F228F0;
	Sat,  6 Jul 2024 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720282317; cv=none; b=ZYDmwmhGbYEptH0R6glk7HYxOPgc9gOAQ7p2nB03U8AUoTsTEkJgdqoEuG3XRwe37ZVjt8QmVRlEoJL+OLoV8u4ffQgD1RX1kMYLX3CaxMS6Q0aqOfhiutuPfJ78Qk0PbMOueJqYus/DT+C/kgVSzs9UmKNa+1UHrwsT0FLVI5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720282317; c=relaxed/simple;
	bh=oXGlhzAtXvs8UnbMxs5EasAUkT8aokI6Ny/VAaGrsMs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Uh5CgH8FmWqXy522bNhBEf/OiX6YsXe3hIKbBtg0RB+kCIJI7gYbLVZTH+mfY+hywvX0HP4mDMkEaf2X5I7JCNkahRjePXvh0EjOGh0MBIzg8V5dQhvkfBzY+Hb0m6xixJf4rhO+MwJhNpuJFEic6s/TXmphKIxYDvENFEjCpv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Pkn/esCw; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Pkn/esCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720282275; x=1720887075; i=markus.elfring@web.de;
	bh=wSNc5OJvA/+t3BvPmEDcBu11ZZasbicaUTEg3PNG+Ps=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Pkn/esCwkeFzd0Y2BdtCpxzZmmZk4D5mgTxmonMerIe3SizHRtPXXfgEw14SRAzE
	 /fWM+l5iTAMQU/YBrWLDNhBKE64WOsJGZEWly5mSIzLFSHZjJ4nc6OpsbEyFQb5H/
	 YuqHwRg1Z0bU+zaDeNOVuNVMRzVYvP+O0OllZclVRZFgfsthcVEXKjLt2p1eHD5sK
	 9p3OhI3yHNlXleYq7M3eY1IgkcvCvSSEDms0p1/nGpXQ6k2dDCUY9c0PZFbB++e75
	 NQ6yUVCKC6a+LzlIDJP3QRqj2bJIX/gX6IVONBd8cPY9eHTHplI0TTx9MKM8tvMir
	 LyizqUFtKB5YuEYZyQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdO9K-1rr4Ed0zAW-00kW11; Sat, 06
 Jul 2024 18:11:15 +0200
Message-ID: <3c5e38e3-79fe-4989-89ca-f128b0d713cd@web.de>
Date: Sat, 6 Jul 2024 18:11:10 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Aleksandr Mishin <amishin@t-argos.ru>, linux-remoteproc@vger.kernel.org,
 lvc-project@linuxtesting.org, Siddharth Gupta <sidgup@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rishabh Bhatnagar <rishabhb@codeaurora.org>
References: <20240705160252.9628-1-amishin@t-argos.ru>
Subject: Re: [PATCH] remoteproc: Remove unneeded check in elf_strtbl_add()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240705160252.9628-1-amishin@t-argos.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JhyjISt2ccmqmH/76Kuihdc+OpdTt9zOLM4PJD9Gsqb6syXcePa
 JHFWleSjhCqQIocirqtQ+U4zPFUQlzSzhcfm2EHGzHwhRaK1UgxjGqhJcAnjg2lOUCcm11E
 +OIkZif/QzVRpk0gP1cgeRaN69j8i1x0mdhVVWedn2JoHhfI/4lAINBOX2bIxxAfbyNBLUs
 67d9ihVyNsG7JyU8YamyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bZBNrj9zPG0=;v2BQriIfYu1OeqR0HRJPCtppiVF
 Q+CvVn7/Hqs48ZqN4WGNWWL/tnz/T0pLCrqlz37mdQ43Pk3mfFh8tVbAVquQ9qrqQQZF/nhYL
 ILRri+Zd9HrhxyrIVBuL4v3aY8Rld3LHH/HISHSBSYE9BNyfSbqi76KbvjS/8xIxnVDstE9Zq
 Rwnt+wYMHsOh+5szX+1GqOF9Q0KVELEw0svPjPFp38on1BfgKvgwW+kU2QaPLdkeZ6ESFkiLy
 NfVB65a6wqeCqTEjt2wxKeEQlsRgg+kxoPp9u+OYMckJUMpkcFBSctJGHr+K0XI3QSHI13Q/G
 waA9QMQI9P4C9gK+/oUkzQR1I0C9kqpcPyulCLKWWv1Fi5SvD/XXV1TJyIthwUiNVEJImx1Ng
 JjxZngqlijqwQX2nMGO9zTzI5WZfHY6DkemdDXNCyDAN0VQfYw/x7Nasf+/Cb0RpeVb6SC16D
 p6vZxUaUPKb02DHcN7hkjQfjvJK6aYt3nLPD5reDrcPSDMtnwF0vsCp27qEhHOsNxi2CpkG3f
 XHN7TmgxH6KVVTWVVF+LogRFEHcnEjKvoKRxSmH+Y70bnpoFZ/2Y6kBZ2huxENT0kdGJ8k6Sn
 iflVIV0VeE+Jf4zeuJxA1eN2zcdlagbC/HgPdNYQTg/LMH193507Bq//AqKF5qGaB0NXaZqcc
 o6FdYB4yQoWYMNt8z32EouAQcjKAwBlROOj3CTkWxoQwDA/Ef4HKs7dKgKGAWiNFOkfLP6Asu
 PU61kkNc3UsmEUDsaju+YNn6bXfM/dBfwPx6d6dQwW+8EQb0B3hJqxcxKvE4/xUNO5PGEp66W
 cFy+Upje6hboGeMbLe/kffVr50G8C2lbl7mR72xdKfqM4=

=E2=80=A6
> useless.

         because =E2=80=A6?


> Fix this issue by removing unneeded check.

Another wording suggestion:
  Thus remove a redundant check.


=E2=80=A6
> +++ b/drivers/remoteproc/remoteproc_elf_helpers.h
> @@ -107,7 +107,7 @@ static inline unsigned int elf_strtbl_add(const char=
 *name, void *ehdr, u8 class
>  	shdr =3D ehdr + elf_size_of_hdr(class) + shstrndx * elf_size_of_shdr(c=
lass);
>  	strtab =3D ehdr + elf_shdr_get_sh_offset(class, shdr);
>  	idx =3D index ? *index : 0;
> -	if (!strtab || !name)
> +	if (!name)
>  		return 0;
=E2=80=A6

How do you think about to perform the remaining null pointer check
as the first statement (because of input parameter validation in
this function implementation)?

Regards,
Markus
