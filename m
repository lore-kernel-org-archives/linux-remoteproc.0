Return-Path: <s-anna@ti.com>
Subject: Re: [PATCHv7 15/15] remoteproc/omap: Switch to SPDX license
 identifiers
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-16-t-kristo@ti.com> <20200304224220.GC2799@xps15>
From: Suman Anna <s-anna@ti.com>
Message-ID: <28ab188e-9e6e-35dd-c423-30aaa80afb90@ti.com>
Date: Wed, 4 Mar 2020 18:24:49 -0600
MIME-Version: 1.0
In-Reply-To: <20200304224220.GC2799@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tero Kristo <t-kristo@ti.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, afd@ti.com, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/4/20 4:42 PM, Mathieu Poirier wrote:
> On Fri, Feb 21, 2020 at 12:19:36PM +0200, Tero Kristo wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> Use the appropriate SPDX license identifiers in various OMAP remoteproc
>> source files and drop the previous boilerplate license text.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>  drivers/remoteproc/omap_remoteproc.h | 27 +--------------------------
>>  1 file changed, 1 insertion(+), 26 deletions(-)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
>> index 13f17d9135c0..828e13256c02 100644
>> --- a/drivers/remoteproc/omap_remoteproc.h
>> +++ b/drivers/remoteproc/omap_remoteproc.h
>> @@ -1,35 +1,10 @@
>> +/* SPDX-License-Identifier: BSD-3-Clause */
> 
> This is odd considering omap_remoteproc.c is GPL-2.0-only

We were using these enums on the firmware-side as well. The first
version of this in v1 [1] is actually using Dual BSD and GPL-2.0-only,
but even that one had posed some questions, so just converting to use
the SPDX for the original license text.

regards
Suman

[1] https://patchwork.kernel.org/patch/11215415/
> 
> Thanks,
> Mathieu
> 
>>  /*
>>   * Remote processor messaging
>>   *
>>   * Copyright (C) 2011-2020 Texas Instruments, Inc.
>>   * Copyright (C) 2011 Google, Inc.
>>   * All rights reserved.
>> - *
>> - * Redistribution and use in source and binary forms, with or without
>> - * modification, are permitted provided that the following conditions
>> - * are met:
>> - *
>> - * * Redistributions of source code must retain the above copyright
>> - *   notice, this list of conditions and the following disclaimer.
>> - * * Redistributions in binary form must reproduce the above copyright
>> - *   notice, this list of conditions and the following disclaimer in
>> - *   the documentation and/or other materials provided with the
>> - *   distribution.
>> - * * Neither the name Texas Instruments nor the names of its
>> - *   contributors may be used to endorse or promote products derived
>> - *   from this software without specific prior written permission.
>> - *
>> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
>> - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>> - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
>> - * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
>> - * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
>> - * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
>> - * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
>> - * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
>> - * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>> - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
>> - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>   */
>>  
>>  #ifndef _OMAP_RPMSG_H
>> -- 
>> 2.17.1
>>
>> --
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
